# WN11-UC-000015 — Toast Notifications to the Lock Screen Must Be Turned Off

## Vulnerability Discussion

Toast notifications that are displayed on the lock screen could display sensitive information to unauthorized personnel. Turning off this feature will limit access to the information to a logged on user.

## STIG Details

| Field        | Value |
|-------------|-------|
| **STIG ID**     | WN11-UC-000015 |
| **Rule ID**     | SV-253477r1260004_rule |
| **Vuln ID**     | V-253477 |
| **Severity**    | CAT III (Low) |
| **CCI**         | CCI-000381 |
| **GPO Path**    | User Configuration >> Administrative Templates >> Start Menu and Taskbar >> Notifications >> 'Turn off toast notifications on the lock screen' to 'Enabled' |

## Registry Fix

| Field | Value |
|-------|-------|
| **Path** | `HKCU:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications` |
| **Name** | `NoToastApplicationNotificationOnLockScreen` |
| **Value** | `1` |
| **Type** | `DWord` |

## Check

If the policy 'Turn off toast notifications on the lock screen' is not set to 'Enabled', this is a finding.

```powershell
Get-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" -Name "NoToastApplicationNotificationOnLockScreen"
```

## Fix

Configure the policy to turn off toast notifications on the lock screen.

```powershell
.\Remediate-WN11-UC-000015.ps1
```

## Undo

To revert to the default (pre-hardened) state:

```powershell
.\Undo-WN11-UC-000015.ps1
```

## Evidence

| Stage | Screenshot |
|-------|-----------|
| Before (Tenable scan, failed) | ![Before](screenshots/before.png) |
| Script execution | ![Script](screenshots/remediation.png) |
| After (Tenable scan, passed) | ![After](screenshots/after.png) |
