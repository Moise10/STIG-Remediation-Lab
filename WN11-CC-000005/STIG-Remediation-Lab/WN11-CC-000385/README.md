# WN11-CC-000385 — Windows Ink Workspace Must Be Configured to Disallow Access Above the Lock

## Vulnerability Discussion

This action secures Windows Ink, which contains applications and features oriented toward pen computing. Allowing access above the lock could expose system features to unauthorized users.

## STIG Details

| Field        | Value |
|-------------|-------|
| **STIG ID**     | WN11-CC-000385 |
| **Rule ID**     | SV-253420r958404_rule |
| **Vuln ID**     | V-253420 |
| **Severity**    | CAT II (Medium) |
| **CCI**         | CCI-000060 |
| **GPO Path**    | Computer Configuration >> Administrative Templates >> Windows Components >> Windows Ink Workspace >> Set 'Allow Windows Ink Workspace' to 'Enabled' and set Options 'On, but disallow access above lock' |

## Registry Fix

| Field | Value |
|-------|-------|
| **Path** | `HKLM:\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace` |
| **Name** | `AllowWindowsInkWorkspace` |
| **Value** | `1` |
| **Type** | `DWord` |

## Check

If the policy 'Allow Windows Ink Workspace' is not set to 'Enabled' with 'On, but disallow access above lock' selected, this is a finding.

```powershell
Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace" -Name "AllowWindowsInkWorkspace"
```

## Fix

Configure the policy to allow Windows Ink Workspace but disallow access above the lock.

```powershell
.\Remediate-WN11-CC-000385.ps1
```

## Undo

To revert to the default (pre-hardened) state:

```powershell
.\Undo-WN11-CC-000385.ps1
```

## Evidence

| Stage | Screenshot |
|-------|-----------|
| Before (Tenable scan, failed) | ![Before](screenshots/before.png) |
| Script execution | ![Script](screenshots/remediation.png) |
| After (Tenable scan, passed) | ![After](screenshots/after.png) |
