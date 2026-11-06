# WN11-CC-000185 — The Default Autorun Behavior Must Be Configured to Prevent Autorun Commands

## Vulnerability Discussion

Allowing autorun commands to execute may introduce malicious code to a system. Configuring this setting prevents autorun commands from executing.

## STIG Details

| Field        | Value |
|-------------|-------|
| **STIG ID**     | WN11-CC-000185 |
| **Rule ID**     | SV-253387r958804_rule |
| **Vuln ID**     | V-253387 |
| **Severity**    | CAT I (High) |
| **CCI**         | CCI-001764 |
| **GPO Path**    | Computer Configuration >> Administrative Templates >> Windows Components >> AutoPlay Policies >> 'Set the default behavior for AutoRun' to 'Enabled:Do not execute any autorun commands' |

## Registry Fix

| Field | Value |
|-------|-------|
| **Path** | `HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer` |
| **Name** | `NoAutorun` |
| **Value** | `1` |
| **Type** | `DWord` |

## Check

If the policy 'Set the default behavior for AutoRun' is not set to 'Enabled:Do not execute any autorun commands', this is a finding.

```powershell
Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoAutorun"
```

## Fix

Configure the default behavior for AutoRun to not execute autorun commands.

```powershell
.\Remediate-WN11-CC-000185.ps1
```

## Undo

To revert to the default (pre-hardened) state:

```powershell
.\Undo-WN11-CC-000185.ps1
```

## Evidence

| Stage | Screenshot |
|-------|-----------|
| Before (Tenable scan, failed) | ![Before](screenshots/before.png) |
| Script execution | ![Script](screenshots/remediation.png) |
| After (Tenable scan, passed) | ![After](screenshots/after.png) |
