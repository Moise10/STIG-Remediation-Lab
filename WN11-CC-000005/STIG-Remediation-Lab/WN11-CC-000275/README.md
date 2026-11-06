# WN11-CC-000275 — Local Drives Must Be Prevented from Sharing with Remote Desktop Session Hosts

## Vulnerability Discussion

Preventing users from sharing the local drives on their client computers to Remote Session Hosts that they access helps reduce possible exposure of sensitive data.

## STIG Details

| Field        | Value |
|-------------|-------|
| **STIG ID**     | WN11-CC-000275 |
| **Rule ID**     | SV-253403r1268233_rule |
| **Vuln ID**     | V-253403 |
| **Severity**    | CAT II (Medium) |
| **CCI**         | CCI-001090 |
| **GPO Path**    | Computer Configuration >> Administrative Templates >> Windows Components >> Remote Desktop Services >> Remote Desktop Session Host >> Device and Resource Redirection >> 'Do not allow drive redirection' to 'Enabled' |

## Registry Fix

| Field | Value |
|-------|-------|
| **Path** | `HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services` |
| **Name** | `fDisableCdm` |
| **Value** | `1` |
| **Type** | `DWord` |

## Check

If the policy 'Do not allow drive redirection' is not set to 'Enabled', this is a finding.

```powershell
Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "fDisableCdm"
```

## Fix

Configure the policy to prevent drive redirection in Remote Desktop sessions.

```powershell
.\Remediate-WN11-CC-000275.ps1
```

## Undo

To revert to the default (pre-hardened) state:

```powershell
.\Undo-WN11-CC-000275.ps1
```

## Evidence

| Stage | Screenshot |
|-------|-----------|
| Before (Tenable scan, failed) | ![Before](screenshots/before.png) |
| Script execution | ![Script](screenshots/remediation.png) |
| After (Tenable scan, passed) | ![After](screenshots/after.png) |
