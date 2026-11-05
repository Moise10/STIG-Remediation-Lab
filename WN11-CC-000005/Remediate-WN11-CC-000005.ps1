
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
