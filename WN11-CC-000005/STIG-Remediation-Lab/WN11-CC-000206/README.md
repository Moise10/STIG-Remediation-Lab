# WN11-CC-000206 — Windows Update Must Not Obtain Updates from Other PCs on the Internet

## Vulnerability Discussion

Windows 11 allows Windows Update to obtain updates from additional sources instead of Microsoft. To minimize outside exposure, obtaining updates from or sending to systems on the internet must be prevented.

## STIG Details

| Field        | Value |
|-------------|-------|
| **STIG ID**     | WN11-CC-000206 |
| **Rule ID**     | SV-253398r958928_rule |
| **Vuln ID**     | V-253398 |
| **Severity**    | CAT III (Low) |
| **CCI**         | CCI-000366 |
| **GPO Path**    | Computer Configuration >> Administrative Templates >> Windows Components >> Delivery Optimization >> 'Download Mode' to 'Enabled' with any option except 'Internet' selected |

## Registry Fix

| Field | Value |
|-------|-------|
| **Path** | `HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization` |
| **Name** | `DODownloadMode` |
| **Value** | `1` |
| **Type** | `DWord` |

## Check

If the Delivery Optimization Download Mode is set to 3 (Internet), this is a finding. Acceptable values: 0 (HTTP only), 1 (LAN), 2 (Group), 99 (Simple), 100 (Bypass).

```powershell
Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" -Name "DODownloadMode"
```

## Fix

Configure Delivery Optimization download mode to LAN only (1) or another acceptable option.

```powershell
.\Remediate-WN11-CC-000206.ps1
```

## Undo

To revert to the default (pre-hardened) state:

```powershell
.\Undo-WN11-CC-000206.ps1
```

## Evidence

| Stage | Screenshot |
|-------|-----------|
| Before (Tenable scan, failed) | ![Before](screenshots/before.png) |
| Script execution | ![Script](screenshots/remediation.png) |
| After (Tenable scan, passed) | ![After](screenshots/after.png) |
