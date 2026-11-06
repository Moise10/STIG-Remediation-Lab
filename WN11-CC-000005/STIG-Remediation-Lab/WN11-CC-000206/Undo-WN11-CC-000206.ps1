<#
.SYNOPSIS
    STIG Undo: WN11-CC-000206 - Revert Windows Update Must Not Obtain Updates from Other PCs on the Internet

.NOTES
    Author          : Moise Mbakop
    LinkedIn        : https://linkedin.com/in/moise-mbakop/
    GitHub          : https://github.com/Moise10
    Date Created    : 2026-11-06
    Last Modified   : 2026-11-06
    Version         : 1.0
    STIG-ID         : WN11-CC-000206

.USAGE
    Run in an elevated PowerShell session:
    .\Undo-WN11-CC-000206.ps1
#>

# ── Remove the STIG setting ──
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization"
$RegName = "DODownloadMode"

try {
    Remove-ItemProperty -Path $RegPath -Name $RegName -Force -ErrorAction Stop
    Write-Host "[↩] Removed $RegName from $RegPath" -ForegroundColor Yellow
    Write-Host "[✓] WN11-CC-000206 reverted to default." -ForegroundColor Cyan
} catch {
    Write-Host "[!] Property not found or already removed." -ForegroundColor DarkYellow
}
