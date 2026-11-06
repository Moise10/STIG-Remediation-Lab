<#
.SYNOPSIS
    Remediates all 10 DISA Windows 11 STIG v2r11 findings in one script.

.NOTES
    Author          : Moise Mbakop
    LinkedIn        : linkedin.com/in/moise-mbakop/
    GitHub          : github.com/Moise10
    Date Created    : 2026-11-05
    Last Modified   : 2026-11-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-IDs        : WN11-CC-000005, WN11-CC-000010, WN11-CC-000185, WN11-CC-000190,
                      WN11-CC-000206, WN11-CC-000270, WN11-CC-000275, WN11-CC-000385,
                      WN11-AU-000500, WN11-UC-000015
    Benchmark       : DISA Windows 11 STIG v2r11
    Documentation   : https://stigaview.com/products/win11/v2r11/

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run as Administrator to remediate all 10 STIGs.
    Example syntax:
    PS C:\> .\Remediate-All-STIGs.ps1
#>

Write-Output "============================================"
Write-Output "  DISA Windows 11 STIG v2r11 Remediation"
Write-Output "  10 Findings - Automated Fix"
Write-Output "============================================"
Write-Output ""

$stigCount = 0
$passCount = 0

# ── 1. WN11-CC-000005 ──────────────────────────────────────────────
# Camera access from the lock screen must be disabled
# Severity: CAT II (Medium) | CCI: CCI-000381 | Vuln: V-253350
Write-Output "[1/10] WN11-CC-000005 - Camera access from the lock screen must be disabled"
$stigCount++
$regPath  = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$regName  = "NoLockScreenCamera"
$regValue = 1

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
    Write-Output "[INFO] Created registry path: $regPath"
}

Set-ItemProperty -Path $regPath -Name $regName -Value $regValue -Type DWord
Write-Output "[INFO] Set $regName to $regValue at $regPath"

$currentValue = (Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue).$regName
if ($currentValue -eq $regValue) {
    $passCount++
    Write-Output "[PASS] WN11-CC-000005 remediated successfully. $regName = $currentValue"
} else {
    Write-Output "[FAIL] WN11-CC-000005 remediation failed. Current value: $currentValue"
}
Write-Output ""

# ── 2. WN11-CC-000010 ──────────────────────────────────────────────
# Display of slide shows on the lock screen must be disabled
# Severity: CAT II (Medium) | CCI: CCI-000381 | Vuln: V-253352
Write-Output "[2/10] WN11-CC-000010 - Display of slide shows on the lock screen must be disabled"
$stigCount++
$regPath  = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$regName  = "NoLockScreenSlideshow"
$regValue = 1

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
    Write-Output "[INFO] Created registry path: $regPath"
}

Set-ItemProperty -Path $regPath -Name $regName -Value $regValue -Type DWord
Write-Output "[INFO] Set $regName to $regValue at $regPath"

$currentValue = (Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue).$regName
if ($currentValue -eq $regValue) {
    $passCount++
    Write-Output "[PASS] WN11-CC-000010 remediated successfully. $regName = $currentValue"
} else {
    Write-Output "[FAIL] WN11-CC-000010 remediation failed. Current value: $currentValue"
}
Write-Output ""

# ── 3. WN11-CC-000185 ──────────────────────────────────────────────
# Default autorun behavior must prevent autorun commands
# Severity: CAT I (High) | CCI: CCI-001764 | Vuln: V-253387
Write-Output "[3/10] WN11-CC-000185 - Default autorun behavior must prevent autorun commands"
$stigCount++
$regPath  = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
$regName  = "NoAutorun"
$regValue = 1

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
    Write-Output "[INFO] Created registry path: $regPath"
}

Set-ItemProperty -Path $regPath -Name $regName -Value $regValue -Type DWord
Write-Output "[INFO] Set $regName to $regValue at $regPath"

$currentValue = (Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue).$regName
if ($currentValue -eq $regValue) {
    $passCount++
    Write-Output "[PASS] WN11-CC-000185 remediated successfully. $regName = $currentValue"
} else {
    Write-Output "[FAIL] WN11-CC-000185 remediation failed. Current value: $currentValue"
}
Write-Output ""

# ── 4. WN11-CC-000190 ──────────────────────────────────────────────
# Autoplay must be disabled for all drives
# Severity: CAT I (High) | CCI: CCI-001764 | Vuln: V-253388
Write-Output "[4/10] WN11-CC-000190 - Autoplay must be disabled for all drives"
$stigCount++
$regPath  = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
$regName  = "NoDriveTypeAutoRun"
$regValue = 255

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
    Write-Output "[INFO] Created registry path: $regPath"
}

Set-ItemProperty -Path $regPath -Name $regName -Value $regValue -Type DWord
Write-Output "[INFO] Set $regName to $regValue at $regPath"

$currentValue = (Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue).$regName
if ($currentValue -eq $regValue) {
    $passCount++
    Write-Output "[PASS] WN11-CC-000190 remediated successfully. $regName = $currentValue"
} else {
    Write-Output "[FAIL] WN11-CC-000190 remediation failed. Current value: $currentValue"
}
Write-Output ""

# ── 5. WN11-CC-000206 ──────────────────────────────────────────────
# Windows Update must not obtain updates from other PCs on the internet
# Severity: CAT III (Low) | CCI: CCI-000366 | Vuln: V-253398
Write-Output "[5/10] WN11-CC-000206 - Windows Update must not obtain updates from other PCs on the internet"
$stigCount++
$regPath  = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization"
$regName  = "DODownloadMode"
$regValue = 0

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
    Write-Output "[INFO] Created registry path: $regPath"
}

Set-ItemProperty -Path $regPath -Name $regName -Value $regValue -Type DWord
Write-Output "[INFO] Set $regName to $regValue at $regPath"

$currentValue = (Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue).$regName
if ($currentValue -eq $regValue) {
    $passCount++
    Write-Output "[PASS] WN11-CC-000206 remediated successfully. $regName = $currentValue"
} else {
    Write-Output "[FAIL] WN11-CC-000206 remediation failed. Current value: $currentValue"
}
Write-Output ""

# ── 6. WN11-CC-000270 ──────────────────────────────────────────────
# Passwords must not be saved in the Remote Desktop Client
# Severity: CAT II (Medium) | CCI: CCI-002038 | Vuln: V-253402
Write-Output "[6/10] WN11-CC-000270 - Passwords must not be saved in the Remote Desktop Client"
$stigCount++
$regPath  = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
$regName  = "DisablePasswordSaving"
$regValue = 1

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
    Write-Output "[INFO] Created registry path: $regPath"
}

Set-ItemProperty -Path $regPath -Name $regName -Value $regValue -Type DWord
Write-Output "[INFO] Set $regName to $regValue at $regPath"

$currentValue = (Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue).$regName
if ($currentValue -eq $regValue) {
    $passCount++
    Write-Output "[PASS] WN11-CC-000270 remediated successfully. $regName = $currentValue"
} else {
    Write-Output "[FAIL] WN11-CC-000270 remediation failed. Current value: $currentValue"
}
Write-Output ""

# ── 7. WN11-CC-000275 ──────────────────────────────────────────────
# Local drives must be prevented from sharing with RD Session Hosts
# Severity: CAT II (Medium) | CCI: CCI-001090 | Vuln: V-253403
Write-Output "[7/10] WN11-CC-000275 - Local drives must be prevented from sharing with RD Session Hosts"
$stigCount++
$regPath  = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
$regName  = "fDisableCdm"
$regValue = 1

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
    Write-Output "[INFO] Created registry path: $regPath"
}

Set-ItemProperty -Path $regPath -Name $regName -Value $regValue -Type DWord
Write-Output "[INFO] Set $regName to $regValue at $regPath"

$currentValue = (Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue).$regName
if ($currentValue -eq $regValue) {
    $passCount++
    Write-Output "[PASS] WN11-CC-000275 remediated successfully. $regName = $currentValue"
} else {
    Write-Output "[FAIL] WN11-CC-000275 remediation failed. Current value: $currentValue"
}
Write-Output ""

# ── 8. WN11-CC-000385 ──────────────────────────────────────────────
# Windows Ink Workspace must disallow access above the lock
# Severity: CAT II (Medium) | CCI: CCI-000060 | Vuln: V-253420
Write-Output "[8/10] WN11-CC-000385 - Windows Ink Workspace must disallow access above the lock"
$stigCount++
$regPath  = "HKLM:\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace"
$regName  = "AllowWindowsInkWorkspace"
$regValue = 1

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
    Write-Output "[INFO] Created registry path: $regPath"
}

Set-ItemProperty -Path $regPath -Name $regName -Value $regValue -Type DWord
Write-Output "[INFO] Set $regName to $regValue at $regPath"

$currentValue = (Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue).$regName
if ($currentValue -eq $regValue) {
    $passCount++
    Write-Output "[PASS] WN11-CC-000385 remediated successfully. $regName = $currentValue"
} else {
    Write-Output "[FAIL] WN11-CC-000385 remediation failed. Current value: $currentValue"
}
Write-Output ""

# ── 9. WN11-AU-000500 ──────────────────────────────────────────────
# Application event log size must be configured to 32768 KB or greater
# Severity: CAT II (Medium) | CCI: CCI-001849 | Vuln: V-253337
Write-Output "[9/10] WN11-AU-000500 - Application event log size must be configured to 32768 KB or greater"
$stigCount++
$regPath  = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$regName  = "MaxSize"
$regValue = 32768

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
    Write-Output "[INFO] Created registry path: $regPath"
}

Set-ItemProperty -Path $regPath -Name $regName -Value $regValue -Type DWord
Write-Output "[INFO] Set $regName to $regValue at $regPath"

$currentValue = (Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue).$regName
if ($currentValue -eq $regValue) {
    $passCount++
    Write-Output "[PASS] WN11-AU-000500 remediated successfully. $regName = $currentValue"
} else {
    Write-Output "[FAIL] WN11-AU-000500 remediation failed. Current value: $currentValue"
}
Write-Output ""

# ── 10. WN11-UC-000015 ─────────────────────────────────────────────
# Toast notifications to the lock screen must be turned off
# Severity: CAT III (Low) | CCI: CCI-000381 | Vuln: V-253477
Write-Output "[10/10] WN11-UC-000015 - Toast notifications to the lock screen must be turned off"
$stigCount++
$regPath  = "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications"
$regName  = "NoToastApplicationNotificationOnLockScreen"
$regValue = 1

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
    Write-Output "[INFO] Created registry path: $regPath"
}

Set-ItemProperty -Path $regPath -Name $regName -Value $regValue -Type DWord
Write-Output "[INFO] Set $regName to $regValue at $regPath"

$currentValue = (Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue).$regName
if ($currentValue -eq $regValue) {
    $passCount++
    Write-Output "[PASS] WN11-UC-000015 remediated successfully. $regName = $currentValue"
} else {
    Write-Output "[FAIL] WN11-UC-000015 remediation failed. Current value: $currentValue"
}
Write-Output ""

# ── Summary ────────────────────────────────────────────────────────
Write-Output "============================================"
Write-Output "  Results: $passCount / $stigCount STIGs remediated"
Write-Output "============================================"
