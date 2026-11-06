<#
.SYNOPSIS
    STIG Undo: WN11-CC-000190 - Revert Autoplay Must Be Disabled for All Drives

.NOTES
    Author          : Moise Mbakop
    LinkedIn        : https://linkedin.com/in/moise-mbakop/
    GitHub          : https://github.com/Moise10
    Date Created    : 2026-11-06
    Last Modified   : 2026-11-06
    Version         : 1.0
    STIG-ID         : WN11-CC-000190

.USAGE
    Run in an elevated PowerShell session:
    .\Undo-WN11-CC-000190.ps1
#>

# ── Remove the STIG setting ──
$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
$RegName = "NoDriveTypeAutoRun"

try {
    Remove-ItemProperty -Path $RegPath -Name $RegName -Force -ErrorAction Stop
    Write-Host "[↩] Removed $RegName from $RegPath" -ForegroundColor Yellow
    Write-Host "[✓] WN11-CC-000190 reverted to default." -ForegroundColor Cyan
} catch {
    Write-Host "[!] Property not found or already removed." -ForegroundColor DarkYellow
}
