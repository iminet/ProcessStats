<#
.SYNOPSIS
PowerShell module to analyze duplicated processes' memory and CPU usage.
#>

# -----------------------
# Cmdlet 1: Memory Usage
# -----------------------
function Get-ProcessMemory {
    [CmdletBinding()]
    param(
        [int]$MinCount = 2
    )

    Get-Process |
        Group-Object Name |
        Where-Object Count -ge $MinCount |
        ForEach-Object {
            [PSCustomObject]@{
                Name  = $_.Name
                Count = $_.Count
                'Memory Sum in MB' = [math]::Round(
                    (($_.Group | Measure-Object WorkingSet -Sum).Sum / 1MB), 3
                )
            }
        } |
        Sort-Object 'Memory Sum in MB' -Descending
}

# -----------------------
# Cmdlet 2: CPU Usage
# -----------------------
function Get-ProcessCPU {
    [CmdletBinding()]
    param(
        [int]$MinCount = 2
    )

    Get-Process |
        Group-Object Name |
        Where-Object Count -ge $MinCount |
        ForEach-Object {
            [PSCustomObject]@{
                Name  = $_.Name
                Count = $_.Count
                'CPU Total (%)' = [math]::Round(
                    ($_.Group | Measure-Object CPU -Sum).Sum, 2
                )
            }
        } |
        Sort-Object 'CPU Total (%)' -Descending
}

# Export both cmdlets
Export-ModuleMember -Function Get-ProcessMemory, Get-ProcessCPU
