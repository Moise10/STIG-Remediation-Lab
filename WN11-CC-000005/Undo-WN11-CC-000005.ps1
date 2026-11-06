<#
.SYNOPSIS
    Reverts all 10 DISA Windows 11 STIG v2r11 remediations by removing the registry values,
    restoring the system to a non-compliant (default) state for testing.

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
    Run as Administrator to revert all 10 STIGs for testing.
    Example syntax:
    PS C:\> .\Undo-All-STIGs.ps1
#>

Write-Output "============================================"
Write-Output "  DISA Windows 11 STIG v2r11 Undo"
Write-Output "  Reverting 10 Findings to Default"
Write-Output "============================================"
Write-Output ""

$stigCount = 0
$undoCount = 0

# ── 1. WN11-CC-000005 ──────────────────────────────────────────────
# Camera access from the lock screen must be disabled
Write-Output "[1/10] Reverting WN11-CC-000005 - Camera access from the lock screen"
$stigCount++
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$regName = "NoLockScreenCamera"

if (Test-Path $regPath) {
    Remove-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue
    $undoCount++
    Write-Output "[INFO] Removed $regName from $regPath"
    Write-Output "[INFO] WN11-CC-000005 reverted. Next scan should show FAIL."
} else {
    Write-Output "[INFO] Registry path does not exist. STIG is already in a non-compliant state."
}
Write-Output ""

# ── 2. WN11-CC-000010 ──────────────────────────────────────────────
# Display of slide shows on the lock screen must be disabled
Write-Output "[2/10] Reverting WN11-CC-000010 - Lock screen slide show"
$stigCount++
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$regName = "NoLockScreenSlideshow"

if (Test-Path $regPath) {
    Remove-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue
    $undoCount++
    Write-Output "[INFO] Removed $regName from $regPath"
    Write-Output "[INFO] WN11-CC-000010 reverted. Next scan should show FAIL."
} else {
    Write-Output "[INFO] Registry path does not exist. STIG is already in a non-compliant state."
}
Write-Output ""

# ── 3. WN11-CC-000185 ──────────────────────────────────────────────
# Default autorun behavior must prevent autorun commands
Write-Output "[3/10] Reverting WN11-CC-000185 - Default autorun behavior"
$stigCount++
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
$regName = "NoAutorun"

if (Test-Path $regPath) {
    Remove-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue
    $undoCount++
    Write-Output "[INFO] Removed $regName from $regPath"
    Write-Output "[INFO] WN11-CC-000185 reverted. Next scan should show FAIL."
} else {
    Write-Output "[INFO] Registry path does not exist. STIG is already in a non-compliant state."
}
Write-Output ""

# ── 4. WN11-CC-000190 ──────────────────────────────────────────────
# Autoplay must be disabled for all drives
Write-Output "[4/10] Reverting WN11-CC-000190 - Autoplay for all drives"
$stigCount++
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
$regName = "NoDriveTypeAutoRun"

if (Test-Path $regPath) {
    Remove-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue
    $undoCount++
    Write-Output "[INFO] Removed $regName from $regPath"
    Write-Output "[INFO] WN11-CC-000190 reverted. Next scan should show FAIL."
} else {
    Write-Output "[INFO] Registry path does not exist. STIG is already in a non-compliant state."
}
Write-Output ""

# ── 5. WN11-CC-000206 ──────────────────────────────────────────────
# Windows Update must not obtain updates from other PCs on the internet
Write-Output "[5/10] Reverting WN11-CC-000206 - Windows Update delivery optimization"
$stigCount++
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization"
$regName = "DODownloadMode"

if (Test-Path $regPath) {
    Remove-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue
    $undoCount++
    Write-Output "[INFO] Removed $regName from $regPath"
    Write-Output "[INFO] WN11-CC-000206 reverted. Next scan should show FAIL."
} else {
    Write-Output "[INFO] Registry path does not exist. STIG is already in a non-compliant state."
}
Write-Output ""

# ── 6. WN11-CC-000270 ──────────────────────────────────────────────
# Passwords must not be saved in the Remote Desktop Client
Write-Output "[6/10] Reverting WN11-CC-000270 - RDP password saving"
$stigCount++
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
$regName = "DisablePasswordSaving"

if (Test-Path $regPath) {
    Remove-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue
    $undoCount++
    Write-Output "[INFO] Removed $regName from $regPath"
    Write-Output "[INFO] WN11-CC-000270 reverted. Next scan should show FAIL."
} else {
    Write-Output "[INFO] Registry path does not exist. STIG is already in a non-compliant state."
}
Write-Output ""

# ── 7. WN11-CC-000275 ──────────────────────────────────────────────
# Local drives must be prevented from sharing with RD Session Hosts
Write-Output "[7/10] Reverting WN11-CC-000275 - RDP drive sharing"
$stigCount++
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
$regName = "fDisableCdm"

if (Test-Path $regPath) {
    Remove-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue
    $undoCount++
    Write-Output "[INFO] Removed $regName from $regPath"
    Write-Output "[INFO] WN11-CC-000275 reverted. Next scan should show FAIL."
} else {
    Write-Output "[INFO] Registry path does not exist. STIG is already in a non-compliant state."
}
Write-Output ""

# ── 8. WN11-CC-000385 ──────────────────────────────────────────────
# Windows Ink Workspace must disallow access above the lock
Write-Output "[8/10] Reverting WN11-CC-000385 - Windows Ink Workspace"
$stigCount++
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace"
$regName = "AllowWindowsInkWorkspace"

if (Test-Path $regPath) {
    Remove-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue
    $undoCount++
    Write-Output "[INFO] Removed $regName from $regPath"
    Write-Output "[INFO] WN11-CC-000385 reverted. Next scan should show FAIL."
} else {
    Write-Output "[INFO] Registry path does not exist. STIG is already in a non-compliant state."
}
Write-Output ""

# ── 9. WN11-AU-000500 ──────────────────────────────────────────────
# Application event log size must be configured to 32768 KB or greater
Write-Output "[9/10] Reverting WN11-AU-000500 - Application event log size"
$stigCount++
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$regName = "MaxSize"

if (Test-Path $regPath) {
    Remove-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue
    $undoCount++
    Write-Output "[INFO] Removed $regName from $regPath"
    Write-Output "[INFO] WN11-AU-000500 reverted. Next scan should show FAIL."
} else {
    Write-Output "[INFO] Registry path does not exist. STIG is already in a non-compliant state."
}
Write-Output ""

# ── 10. WN11-UC-000015 ─────────────────────────────────────────────
# Toast notifications to the lock screen must be turned off
Write-Output "[10/10] Reverting WN11-UC-000015 - Toast notifications on lock screen"
$stigCount++
$regPath = "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications"
$regName = "NoToastApplicationNotificationOnLockScreen"

if (Test-Path $regPath) {
    Remove-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue
    $undoCount++
    Write-Output "[INFO] Removed $regName from $regPath"
    Write-Output "[INFO] WN11-UC-000015 reverted. Next scan should show FAIL."
} else {
    Write-Output "[INFO] Registry path does not exist. STIG is already in a non-compliant state."
}
Write-Output ""

# ── Summary ────────────────────────────────────────────────────────
Write-Output "============================================"
Write-Output "  Results: $undoCount / $stigCount STIGs reverted"
Write-Output "============================================"
