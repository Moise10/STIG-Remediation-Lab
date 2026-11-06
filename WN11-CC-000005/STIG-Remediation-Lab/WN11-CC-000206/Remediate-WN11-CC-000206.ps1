<#
.SYNOPSIS
    STIG Remediation: WN11-CC-000206 - Windows Update Must Not Obtain Updates from Other PCs on the Internet

.NOTES
    Author          : Moise Mbakop
    LinkedIn        : https://linkedin.com/in/moise-mbakop/
    GitHub          : https://github.com/Moise10
    Date Created    : 2026-11-06
    Last Modified   : 2026-11-06
    Version         : 1.0
    STIG-ID         : WN11-CC-000206
    Rule-ID         : SV-253398r958928_rule
    Vuln-ID         : V-253398
    Vulnerability   : Windows 11 allows Windows Update to obtain updates from additional sources instead of Microsoft. To minimize outside exposure, obtaining updates from or sending to systems on the internet must be prevented.
    Severity        : CAT III (Low)
    CCI             : CCI-000366
    GPO Path        : Computer Configuration >> Administrative Templates >> Windows Components >> Delivery Optimization >> 'Download Mode' to 'Enabled' with any option except 'Internet' selected
    Documentation   : https://www.stigviewer.com/stig/windows_11/2024-06-24/finding/V-253398

.TESTED ON
    Date            : 2026-11-06
    OS              : Windows 11 Pro (Build 26200)
    Platform        : Azure Virtual Machine
    Scanner         : Tenable Vulnerability Management (Agent-based)

.USAGE
    Run in an elevated PowerShell session:
    .\Remediate-WN11-CC-000206.ps1
#>

# ── Define registry path and value ──
$RegPath  = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization"
$RegName  = "DODownloadMode"
$RegValue = 1
$RegType  = "DWord"

# ── Ensure the registry key exists ──
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
    Write-Host "[+] Created registry key: $RegPath" -ForegroundColor Yellow
}

# ── Apply the STIG setting ──
Set-ItemProperty -Path $RegPath -Name $RegName -Value $RegValue -Type $RegType -Force
Write-Host "[+] Set $RegName = $RegValue at $RegPath" -ForegroundColor Green

# ── Verify ──
$Current = (Get-ItemProperty -Path $RegPath -Name $RegName -ErrorAction SilentlyContinue).$RegName
if ($Current -eq $RegValue) {
    Write-Host "[✓] WN11-CC-000206 remediation verified successfully." -ForegroundColor Cyan
} else {
    Write-Host "[✗] Verification failed. Current value: $Current" -ForegroundColor Red
}
