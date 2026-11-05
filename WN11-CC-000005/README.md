# Windows 11 DISA STIG Remediation Lab

## Overview

This project demonstrates hands-on DISA STIG (Security Technical Implementation Guide) compliance remediation on a Windows 11 Azure VM. Each STIG finding is documented with Tenable scan evidence (before and after), a manual fix walkthrough, and an automated PowerShell remediation script.

## Environment

| Component            | Details                                       |
| -------------------- | --------------------------------------------- |
| **Operating System** | Microsoft Windows 11 Pro Build 26200          |
| **STIG Benchmark**   | DISA Windows 11 STIG v2r11                    |
| **Scanner**          | Tenable Vulnerability Management (Agent Scan) |
| **Infrastructure**   | Azure Virtual Machine                         |
| **Automation**       | PowerShell 5.1+                               |

## Baseline Scan Results

Initial compliance scan against DISA Windows 11 STIG v2r11:

| Status      | Count |
| ----------- | ----- |
| **Failed**  | 151   |
| **Warning** | 11    |
| **Passed**  | 96    |
| **Total**   | 258   |

## Remediated STIGs

| STIG ID                             | Title                                               | Severity | Status     |
| ----------------------------------- | --------------------------------------------------- | -------- | ---------- |
| [WN11-CC-000005](./WN11-CC-000005/) | Camera access from the lock screen must be disabled | CAT II   | Remediated |

## Project Structure

```
STIG-Remediation-Lab/
├── README.md
├── WN11-CC-000005/
│   ├── README.md
│   ├── Remediate-WN11-CC-000005.ps1
│   ├── Undo-WN11-CC-000005.ps1
│   └── screenshots/
│       ├── before-remediation.png
│       └── after-remediation.png
```

## Workflow

Each STIG follows this process:

1. **Baseline Scan**: Run Tenable compliance scan to confirm FAIL status
2. **Manual Verification**: Confirm the misconfiguration via registry or policy check
3. **Remediation**: Apply the fix using the PowerShell script
4. **Validation Scan**: Re-run Tenable scan to confirm PASS status
5. **Revert and Re-test**: Undo the fix, scan again (FAIL), then remediate again (PASS) to prove repeatability

## How to Use

1. Clone this repository
2. Open PowerShell as Administrator on a Windows 11 system
3. Navigate to the STIG folder you want to remediate
4. Run the remediation script:

```powershell
.\Remediate-WN11-CC-000005.ps1
```

5. To revert the fix (for testing):

```powershell
.\Undo-WN11-CC-000005.ps1
```

## Tools Used

- **Tenable Vulnerability Management**: Compliance scanning with DISA STIG audit files
- **PowerShell**: Automated remediation scripting
- **Azure**: Cloud VM hosting for lab environment
- **DISA STIGs**: Security configuration benchmarks from the Defense Information Systems Agency

## Author

**Moise Mbakop Noukeu**

- LinkedIn: [linkedin.com/in/moise-mbakop](https://linkedin.com/in/moise-mbakop)
- GitHub: [github.com/Moise10](https://github.com/Moise10)
