
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
