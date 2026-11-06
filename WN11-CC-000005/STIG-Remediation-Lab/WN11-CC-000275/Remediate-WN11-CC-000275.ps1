<#
.SYNOPSIS
    STIG Remediation: WN11-CC-000275 - Local Drives Must Be Prevented from Sharing with Remote Desktop Session Hosts

.NOTES
    Author          : Moise Mbakop
    LinkedIn        : https://linkedin.com/in/moise-mbakop/
    GitHub          : https://github.com/Moise10
    Date Created    : 2026-11-06
    Last Modified   : 2026-11-06
    Version         : 1.0
    STIG-ID         : WN11-CC-000275
    Rule-ID         : SV-253403r1268233_rule
    Vuln-ID         : V-253403
    Vulnerability   : Preventing users from sharing the local drives on their client computers to Remote Session Hosts that they access helps reduce possible exposure of sensitive data.
    Severity        : CAT II (Medium)
    CCI             : CCI-001090
    GPO Path        : Computer Configuration >> Administrative Templates >> Windows Components >> Remote Desktop Services >> Remote Desktop Session Host >> Device and Resource Redirection >> 'Do not allow drive redirection' to 'Enabled'
    Documentation   : https://www.stigviewer.com/stig/windows_11/2024-06-24/finding/V-253403

.TESTED ON
    Date            : 2026-11-06
    OS              : Windows 11 Pro (Build 26200)
    Platform        : Azure Virtual Machine
    Scanner         : Tenable Vulnerability Management (Agent-based)

.USAGE
    Run in an elevated PowerShell session:
    .\Remediate-WN11-CC-000275.ps1
#>

# ── Define registry path and value ──
$RegPath  = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
$RegName  = "fDisableCdm"
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
    Write-Host "[✓] WN11-CC-000275 remediation verified successfully." -ForegroundColor Cyan
} else {
    Write-Host "[✗] Verification failed. Current value: $Current" -ForegroundColor Red
}
