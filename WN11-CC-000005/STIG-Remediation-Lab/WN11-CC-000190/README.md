# WN11-CC-000190 — Autoplay Must Be Disabled for All Drives

## Vulnerability Discussion

Allowing autoplay to execute may introduce malicious code to a system. Autoplay begins reading from a drive as soon as media is inserted in the drive. As a result, the setup file of programs or music on audio media may start.

## STIG Details

| Field        | Value |
|-------------|-------|
| **STIG ID**     | WN11-CC-000190 |
| **Rule ID**     | SV-253388r958804_rule |
| **Vuln ID**     | V-253388 |
| **Severity**    | CAT I (High) |
| **CCI**         | CCI-001764 |
| **GPO Path**    | Computer Configuration >> Administrative Templates >> Windows Components >> AutoPlay Policies >> 'Turn off AutoPlay' to 'Enabled:All Drives' |

## Registry Fix

| Field | Value |
|-------|-------|
| **Path** | `HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer` |
| **Name** | `NoDriveTypeAutoRun` |
| **Value** | `255` |
| **Type** | `DWord` |

## Check

If the policy 'Turn off AutoPlay' is not set to 'Enabled:All Drives', this is a finding.

```powershell
Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoDriveTypeAutoRun"
```

## Fix

Configure the policy to turn off AutoPlay for all drives.

```powershell
.\Remediate-WN11-CC-000190.ps1
```

## Undo

To revert to the default (pre-hardened) state:

```powershell
.\Undo-WN11-CC-000190.ps1
```

## Evidence

| Stage | Screenshot |
|-------|-----------|
| Before (Tenable scan, failed) | ![Before](screenshots/before.png) |
| Script execution | ![Script](screenshots/remediation.png) |
| After (Tenable scan, passed) | ![After](screenshots/after.png) |
