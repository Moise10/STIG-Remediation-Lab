<#
.SYNOPSIS
    Disables camera access from the Windows lock screen by setting the NoLockScreenCamera registry value.

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
    Severity        : CAT II (Medium)
    CCI             : CCI-000381
    Documentation   : https://stigaview.com/products/win11/v2r11/WN11-CC-000005/

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run as Administrator to remediate STIG WN11-CC-000005.
    Example syntax:
    PS C:\> .\Remediate-WN11-CC-000005.ps1
#>

# Registry path and values
$regPath  = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$regName  = "NoLockScreenCamera"
$regValue = 1

# Create the registry key if it does not exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
    Write-Output "[INFO] Created registry path: $regPath"
}

# Set the NoLockScreenCamera value
Set-ItemProperty -Path $regPath -Name $regName -Value $regValue -Type DWord
Write-Output "[INFO] Set $regName to $regValue at $regPath"

# Verify the fix
$currentValue = (Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue).$regName

if ($currentValue -eq 1) {
    Write-Output "[PASS] STIG WN11-CC-000005 remediated successfully. NoLockScreenCamera = $currentValue"
} else {
    Write-Output "[FAIL] STIG WN11-CC-000005 remediation failed. Current value: $currentValue"
}
