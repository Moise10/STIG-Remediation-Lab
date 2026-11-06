# STIG Implementation: WN11-CC-000005

## Overview

| Field | Value |
|-------|-------|
| **STIG ID** | WN11-CC-000005 |
| **Vulnerability ID** | V-253350 |
| **Rule Title** | Camera access from the lock screen must be disabled |
| **Severity** | CAT II (Medium) |
| **CCI** | CCI-000381 |
| **STIG Version** | Microsoft Windows 11 STIG v2r11 |

## Description

Enabling camera access from the lock screen could allow unauthorized use. Requiring logon ensures the device is only used by authorized personnel. This control disables the camera on the Windows lock screen via Group Policy registry settings.

## Check (How to Verify)

If the device does not have a camera, this is Not Applicable.

Check the registry value:

```
HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization\NoLockScreenCamera
```

If `NoLockScreenCamera` (REG_DWORD) is missing or not set to `1`, this is a **finding**.

Command to check manually:

```powershell
Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Name NoLockScreenCamera
```

## Manual Fix

1. Open **Group Policy Editor** (`gpedit.msc`)
2. Navigate to: Computer Configuration > Administrative Templates > Control Panel > Personalization
3. Set **"Prevent enabling lock screen camera"** to **Enabled**
4. Run `gpupdate /force`

## Automated Fix (PowerShell)

Run `Remediate-WN11-CC-000005.ps1` as Administrator:

```powershell
.\Remediate-WN11-CC-000005.ps1
```

The script:
1. Creates the registry path if it does not exist
2. Sets `NoLockScreenCamera` to `1` (REG_DWORD)
3. Verifies the value was applied and outputs PASS or FAIL

## Revert (for testing)

Run `Undo-WN11-CC-000005.ps1` as Administrator to remove the fix and confirm the Tenable scan shows a failure:

```powershell
.\Undo-WN11-CC-000005.ps1
```

## Scan Results

### Before Remediation (Baseline)
> *Insert Tenable scan screenshot showing FAIL*

### After Manual Fix
> *Insert Tenable scan screenshot showing PASS*

### After Revert
> *Insert Tenable scan screenshot showing FAIL*

### After PowerShell Remediation
> *Insert Tenable scan screenshot showing PASS*

## References

- [STIGaview: WN11-CC-000005](https://stigaview.com/products/win11/v2r11/WN11-CC-000005/)
- [STIG Viewer: V-253350](https://www.stigviewer.com/stigs/microsoft_windows_11/2026-02-12/finding/V-253350)
