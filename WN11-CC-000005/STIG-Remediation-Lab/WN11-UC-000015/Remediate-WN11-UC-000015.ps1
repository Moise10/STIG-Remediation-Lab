<#
.SYNOPSIS
    STIG Remediation: WN11-UC-000015 - Toast Notifications to the Lock Screen Must Be Turned Off

.NOTES
    Author          : Moise Mbakop
    LinkedIn        : https://linkedin.com/in/moise-mbakop/
    GitHub          : https://github.com/Moise10
    Date Created    : 2026-11-06
    Last Modified   : 2026-11-06
    Version         : 1.0
    STIG-ID         : WN11-UC-000015
    Rule-ID         : SV-253477r1260004_rule
    Vuln-ID         : V-253477
    Vulnerability   : Toast notifications that are displayed on the lock screen could display sensitive information to unauthorized personnel. Turning off this feature will limit access to the information to a logged on user.
    Severity        : CAT III (Low)
    CCI             : CCI-000381
    GPO Path        : User Configuration >> Administrative Templates >> Start Menu and Taskbar >> Notifications >> 'Turn off toast notifications on the lock screen' to 'Enabled'
    Documentation   : https://www.stigviewer.com/stig/windows_11/2024-06-24/finding/V-253477

.TESTED ON
    Date            : 2026-11-06
    OS              : Windows 11 Pro (Build 26200)
    Platform        : Azure Virtual Machine
    Scanner         : Tenable Vulnerability Management (Agent-based)

.USAGE
    Run in an elevated PowerShell session:
    .\Remediate-WN11-UC-000015.ps1
#>

# ── Define registry path and value ──
$RegPath  = "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications"
$RegName  = "NoToastApplicationNotificationOnLockScreen"
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
    Write-Host "[✓] WN11-UC-000015 remediation verified successfully." -ForegroundColor Cyan
} else {
    Write-Host "[✗] Verification failed. Current value: $Current" -ForegroundColor Red
}
