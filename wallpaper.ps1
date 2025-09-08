# URL of the wallpaper image to download
$imageUrl = "https://raw.githubusercontent.com/Ahmedazim7804/random/refs/heads/main/image.jpeg"

# Local path to save the downloaded image
$localPath = "$env:TEMP\wallpaper.jpg"

# Download the image
Invoke-WebRequest -Uri $imageUrl -OutFile $localPath

# Add the native function to set the wallpaper
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class W {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

# Set the downloaded image as wallpaper
[W]::SystemParametersInfo(20, 0, $localPath, 3)
