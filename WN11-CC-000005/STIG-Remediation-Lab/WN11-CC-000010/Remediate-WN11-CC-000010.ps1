<#
.SYNOPSIS
    STIG Remediation: WN11-CC-000010 - The Display of Slide Shows on the Lock Screen Must Be Disabled

.NOTES
    Author          : Moise Mbakop
    LinkedIn        : https://linkedin.com/in/moise-mbakop/
    GitHub          : https://github.com/Moise10
    Date Created    : 2026-11-06
    Last Modified   : 2026-11-06
    Version         : 1.0
    STIG-ID         : WN11-CC-000010
    Rule-ID         : SV-253352r958478_rule
    Vuln-ID         : V-253352
    Vulnerability   : Slide shows that are displayed on the lock screen could display sensitive information to unauthorized personnel. Turning off this feature will limit access to the information to a logged on user.
    Severity        : CAT II (Medium)
    CCI             : CCI-000381
    GPO Path        : Computer Configuration >> Administrative Templates >> Control Panel >> Personalization >> 'Prevent enabling lock screen slide show' to 'Enabled'
    Documentation   : https://www.stigviewer.com/stig/windows_11/2024-06-24/finding/V-253352

.TESTED ON
    Date            : 2026-11-06
    OS              : Windows 11 Pro (Build 26200)
    Platform        : Azure Virtual Machine
    Scanner         : Tenable Vulnerability Management (Agent-based)

.USAGE
    Run in an elevated PowerShell session:
    .\Remediate-WN11-CC-000010.ps1
#>

# ── Define registry path and value ──
$RegPath  = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$RegName  = "NoLockScreenSlideshow"
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
    Write-Host "[✓] WN11-CC-000010 remediation verified successfully." -ForegroundColor Cyan
} else {
    Write-Host "[✗] Verification failed. Current value: $Current" -ForegroundColor Red
}
