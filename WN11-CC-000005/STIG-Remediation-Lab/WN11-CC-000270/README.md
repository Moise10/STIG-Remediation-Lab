# WN11-CC-000270 — Passwords Must Not Be Saved in the Remote Desktop Client

## Vulnerability Discussion

Saving passwords in the Remote Desktop Client could allow an unauthorized user to establish a remote desktop session to another system. The system must be configured to prevent users from saving passwords in the Remote Desktop Client.

## STIG Details

| Field        | Value |
|-------------|-------|
| **STIG ID**     | WN11-CC-000270 |
| **Rule ID**     | SV-253402r1051051_rule |
| **Vuln ID**     | V-253402 |
| **Severity**    | CAT II (Medium) |
| **CCI**         | CCI-002038 |
| **GPO Path**    | Computer Configuration >> Administrative Templates >> Windows Components >> Remote Desktop Services >> Remote Desktop Connection Client >> 'Do not allow passwords to be saved' to 'Enabled' |

## Registry Fix

| Field | Value |
|-------|-------|
| **Path** | `HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services` |
| **Name** | `DisablePasswordSaving` |
| **Value** | `1` |
| **Type** | `DWord` |

## Check

If the policy 'Do not allow passwords to be saved' is not set to 'Enabled', this is a finding.

```powershell
Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "DisablePasswordSaving"
```

## Fix

Configure the policy to prevent saving passwords in the Remote Desktop client.

```powershell
.\Remediate-WN11-CC-000270.ps1
```

## Undo

To revert to the default (pre-hardened) state:

```powershell
.\Undo-WN11-CC-000270.ps1
```

## Evidence

| Stage | Screenshot |
|-------|-----------|
| Before (Tenable scan, failed) | ![Before](screenshots/before.png) |
| Script execution | ![Script](screenshots/remediation.png) |
| After (Tenable scan, passed) | ![After](screenshots/after.png) |
