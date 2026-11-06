# Windows 11 DISA STIG Remediation Lab

## Overview

This project demonstrates hands-on DISA STIG (Security Technical Implementation Guide) compliance remediation on a Windows 11 Azure VM. Each STIG finding is documented with Tenable scan evidence (before and after), a manual fix walkthrough, and an automated PowerShell remediation script.

## Environment

| Component | Details |
|-----------|---------|
| **Operating System** | Microsoft Windows 11 Pro Build 26200 |
| **STIG Benchmark** | DISA Windows 11 STIG v2r11 |
| **Scanner** | Tenable Vulnerability Management (Agent Scan) |
| **Infrastructure** | Azure Virtual Machine |
| **Automation** | PowerShell 5.1+ |

## Baseline Scan Results

Initial compliance scan against DISA Windows 11 STIG v2r11:

| Status | Count |
|--------|-------|
| **Failed** | 150 |
| **Warning** | 11 |
| **Passed** | 97 |
| **Total** | 258 |

## Remediated STIGs

| STIG ID | Title | Severity | Status |
|---------|-------|----------|--------|
| [WN11-CC-000005](./WN11-CC-000005/) | Camera access from the lock screen must be disabled | CAT II | Remediated |
| [WN11-CC-000010](./WN11-CC-000010/) | Display of slide shows on the lock screen must be disabled | CAT II | Remediated |
| [WN11-CC-000185](./WN11-CC-000185/) | Default autorun behavior must prevent autorun commands | **CAT I** | Remediated |
| [WN11-CC-000190](./WN11-CC-000190/) | Autoplay must be disabled for all drives | **CAT I** | Remediated |
| [WN11-CC-000206](./WN11-CC-000206/) | Windows Update must not obtain updates from other PCs on the internet | CAT III | Remediated |
| [WN11-CC-000270](./WN11-CC-000270/) | Passwords must not be saved in the Remote Desktop Client | CAT II | Remediated |
| [WN11-CC-000275](./WN11-CC-000275/) | Local drives must be prevented from sharing with RD Session Hosts | CAT II | Remediated |
| [WN11-CC-000385](./WN11-CC-000385/) | Windows Ink Workspace must disallow access above the lock | CAT II | Remediated |
| [WN11-AU-000500](./WN11-AU-000500/) | Application event log size must be configured to 32768 KB or greater | CAT II | Remediated |
| [WN11-UC-000015](./WN11-UC-000015/) | Toast notifications to the lock screen must be turned off | CAT III | Remediated |

## Project Structure

```
STIG-Remediation-Lab/
├── README.md
├── WN11-AU-000500/
├── WN11-CC-000005/
├── WN11-CC-000010/
├── WN11-CC-000185/
├── WN11-CC-000190/
├── WN11-CC-000206/
├── WN11-CC-000270/
├── WN11-CC-000275/
├── WN11-CC-000385/
└── WN11-UC-000015/
    ├── README.md
    ├── Remediate-<STIG-ID>.ps1
    ├── Undo-<STIG-ID>.ps1
    └── screenshots/
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
