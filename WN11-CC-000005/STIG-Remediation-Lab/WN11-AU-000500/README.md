# WN11-AU-000500 — The Application Event Log Size Must Be Configured to 32768 KB or Greater

## Vulnerability Discussion

Inadequate log size will cause the log to fill up quickly. This may prevent audit events from being recorded properly and require frequent attention by administrative personnel.

## STIG Details

| Field        | Value |
|-------------|-------|
| **STIG ID**     | WN11-AU-000500 |
| **Rule ID**     | SV-253337r958752_rule |
| **Vuln ID**     | V-253337 |
| **Severity**    | CAT II (Medium) |
| **CCI**         | CCI-001849 |
| **GPO Path**    | Computer Configuration >> Administrative Templates >> Windows Components >> Event Log Service >> Application >> 'Specify the maximum log file size (KB)' to 'Enabled' with a 'Maximum Log Size (KB)' of '32768' or greater |

## Registry Fix

| Field | Value |
|-------|-------|
| **Path** | `HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application` |
| **Name** | `MaxSize` |
| **Value** | `32768` |
| **Type** | `DWord` |

## Check

If the Application event log size is not configured to 32768 KB or greater, this is a finding.

```powershell
Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application" -Name "MaxSize"
```

## Fix

Configure the maximum Application event log size to at least 32768 KB (32 MB).

```powershell
.\Remediate-WN11-AU-000500.ps1
```

## Undo

To revert to the default (pre-hardened) state:

```powershell
.\Undo-WN11-AU-000500.ps1
```

## Evidence

| Stage | Screenshot |
|-------|-----------|
| Before (Tenable scan, failed) | ![Before](screenshots/before.png) |
| Script execution | ![Script](screenshots/remediation.png) |
| After (Tenable scan, passed) | ![After](screenshots/after.png) |
