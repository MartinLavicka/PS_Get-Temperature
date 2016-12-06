function Get-Temperature {
    $t = @( Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi" )
    $returntemp = @()
    foreach ($temp in $t)
    {
        $currentTempKelvin = $temp.CurrentTemperature / 10
        $currentTempCelsius = $currentTempKelvin - 273.15
        # $currentTempFahrenheit = (9/5) * $currentTempCelsius + 32
        $returntemp += $temp.InstanceName + " " + $currentTempCelsius.ToString() + "C"
    }
    return $returntemp
}
