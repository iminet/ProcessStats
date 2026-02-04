# ProcessStats

PowerShell module to analyze **duplicate processes** on your system:
- Memory usage (`Get-ProcessMemory`)  
- CPU usage (`Get-ProcessCPU`)

---

## Features

- Lists processes that have **more than one instance running**
- Summarizes:
  - Total memory usage (MB)
  - Total CPU usage (%)
- Sorts output descending
- Cross-machine and script-friendly
- Easy CSV export

---

## Installation

### 1. Install locally from GitHub

1. Clone the repository:

    `git clone https://github.com/iminet/ProcessStats.git`

2. Import the module:

    `Import-Module "C:\WhereverYouCloned\ProcessStats\ProcessStats.psm1" -Force`

3. Verify:

    Get-Module
    Get-Command -Module ProcessStats
   
## 2. Install from PowerShell Gallery

Future plan...
   
---

## Usage
### Memory Usage
```powershell
# Show all processes with 2+ instances
Get-ProcessMemory

# Show processes with 3+ instances
Get-ProcessMemory -MinCount 3
```

Example output:
```powershell
Count Name     Memory Sum in MB
----- ----     ----------------
12    chrome   1845.327
3     dotnet    412.889
2     explorer  153.214
```


### CPU Usage
```powershell
# Show all processes with 2+ instances
Get-DuplicateProcessCPU

# Show processes with 3+ instances
Get-DuplicateProcessCPU -MinCount 3
```

Example output:
```powershell
Count Name     CPU Total (%)
----- ----     -------------
12    chrome   23.45
3     dotnet    7.89
2    explorer   1.25
```
---

## License

MIT License. See LICENSE file for details.
Free to use, modify, and distribute
Attribution appreciated
Compatible with commercial and open-source projects

---

## Notes

Works on PowerShell 5.1 and PowerShell 7+

Designed for Windows systems, but cmdlets are compatible with Linux/macOS PowerShell if Get-Process outputs are available

Recommended for system monitoring, scripting, and identifying memory/CPU bottlenecks from duplicate processes
