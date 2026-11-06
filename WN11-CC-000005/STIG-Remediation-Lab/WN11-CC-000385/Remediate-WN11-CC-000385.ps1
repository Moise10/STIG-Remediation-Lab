<#
.SYNOPSIS
    STIG Remediation: WN11-CC-000385 - Windows Ink Workspace Must Be Configured to Disallow Access Above the Lock

.NOTES
    Author          : Moise Mbakop
    LinkedIn        : https://linkedin.com/in/moise-mbakop/
    GitHub          : https://github.com/Moise10
    Date Created    : 2026-11-06
    Last Modified   : 2026-11-06
    Version         : 1.0
    STIG-ID         : WN11-CC-000385
    Rule-ID         : SV-253420r958404_rule
    Vuln-ID         : V-253420
    Vulnerability   : This action secures Windows Ink, which contains applications and features oriented toward pen computing. Allowing access above the lock could expose system features to unauthorized users.
    Severity        : CAT II (Medium)
    CCI             : CCI-000060
    GPO Path        : Computer Configuration >> Administrative Templates >> Windows Components >> Windows Ink Workspace >> Set 'Allow Windows Ink Workspace' to 'Enabled' and set Options 'On, but disallow access above lock'
    Documentation   : https://www.stigviewer.com/stig/windows_11/2024-06-24/finding/V-253420

.TESTED ON
    Date            : 2026-11-06
    OS              : Windows 11 Pro (Build 26200)
    Platform        : Azure Virtual Machine
    Scanner         : Tenable Vulnerability Management (Agent-based)

.USAGE
    Run in an elevated PowerShell session:
    .\Remediate-WN11-CC-000385.ps1
#>

# ── Define registry path and value ──
$RegPath  = "HKLM:\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace"
$RegName  = "AllowWindowsInkWorkspace"
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
    Write-Host "[✓] WN11-CC-000385 remediation verified successfully." -ForegroundColor Cyan
} else {
    Write-Host "[✗] Verification failed. Current value: $Current" -ForegroundColor Red
}
