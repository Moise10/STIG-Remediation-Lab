# WN11-CC-000010 — The Display of Slide Shows on the Lock Screen Must Be Disabled

## Vulnerability Discussion

Slide shows that are displayed on the lock screen could display sensitive information to unauthorized personnel. Turning off this feature will limit access to the information to a logged on user.

## STIG Details

| Field        | Value |
|-------------|-------|
| **STIG ID**     | WN11-CC-000010 |
| **Rule ID**     | SV-253352r958478_rule |
| **Vuln ID**     | V-253352 |
| **Severity**    | CAT II (Medium) |
| **CCI**         | CCI-000381 |
| **GPO Path**    | Computer Configuration >> Administrative Templates >> Control Panel >> Personalization >> 'Prevent enabling lock screen slide show' to 'Enabled' |

## Registry Fix

| Field | Value |
|-------|-------|
| **Path** | `HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization` |
| **Name** | `NoLockScreenSlideshow` |
| **Value** | `1` |
| **Type** | `DWord` |

## Check

If the policy 'Prevent enabling lock screen slide show' is not set to 'Enabled', this is a finding.

```powershell
Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Name "NoLockScreenSlideshow"
```

## Fix

Configure the policy to prevent enabling the lock screen slide show.

```powershell
.\Remediate-WN11-CC-000010.ps1
```

## Undo

To revert to the default (pre-hardened) state:

```powershell
.\Undo-WN11-CC-000010.ps1
```

## Evidence

| Stage | Screenshot |
|-------|-----------|
| Before (Tenable scan, failed) | ![Before](screenshots/before.png) |
| Script execution | ![Script](screenshots/remediation.png) |
| After (Tenable scan, passed) | ![After](screenshots/after.png) |
