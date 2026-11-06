<#
.SYNOPSIS
    STIG Undo: WN11-CC-000275 - Revert Local Drives Must Be Prevented from Sharing with Remote Desktop Session Hosts

.NOTES
    Author          : Moise Mbakop
    LinkedIn        : https://linkedin.com/in/moise-mbakop/
    GitHub          : https://github.com/Moise10
    Date Created    : 2026-11-06
    Last Modified   : 2026-11-06
    Version         : 1.0
    STIG-ID         : WN11-CC-000275

.USAGE
    Run in an elevated PowerShell session:
    .\Undo-WN11-CC-000275.ps1
#>

# ── Remove the STIG setting ──
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
$RegName = "fDisableCdm"

try {
    Remove-ItemProperty -Path $RegPath -Name $RegName -Force -ErrorAction Stop
    Write-Host "[↩] Removed $RegName from $RegPath" -ForegroundColor Yellow
    Write-Host "[✓] WN11-CC-000275 reverted to default." -ForegroundColor Cyan
} catch {
    Write-Host "[!] Property not found or already removed." -ForegroundColor DarkYellow
}
