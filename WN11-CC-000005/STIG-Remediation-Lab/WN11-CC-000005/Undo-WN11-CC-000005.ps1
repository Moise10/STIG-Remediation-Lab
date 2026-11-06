<#
.SYNOPSIS
    Reverts STIG WN11-CC-000005 by removing the NoLockScreenCamera registry value, restoring the default (camera enabled on lock screen).

.NOTES
    Author          : Moise Mbakop
    LinkedIn        : linkedin.com/in/moise-mbakop/
    GitHub          : github.com/Moise10
    Date Created    : 2026-11-05
    Last Modified   : 2026-11-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000005
    Vulnerability   : V-253350
    Documentation   : https://stigaview.com/products/win11/v2r11/WN11-CC-000005/

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run as Administrator to revert STIG WN11-CC-000005 for testing.
    Example syntax:
    PS C:\> .\Undo-WN11-CC-000005.ps1
#>

# Registry path and value name
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$regName = "NoLockScreenCamera"

if (Test-Path $regPath) {
    Remove-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue
    Write-Output "[INFO] Removed $regName from $regPath"
    Write-Output "[INFO] STIG WN11-CC-000005 reverted. Next scan should show FAIL."
} else {
    Write-Output "[INFO] Registry path does not exist. STIG is already in a non-compliant state."
}
