# Load necessary .NET types
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

if ([Windows.Forms.Clipboard]::ContainsImage()) {

    # get the clipboard image
    $img = [Windows.Forms.Clipboard]::GetImage()

    # set the filename and temporarily store it to the filesystem
    $filename = "img_{0:yyyyMMdd_HHmmss}.png" -f (Get-Date)
    $boxPath = "REMOVED FOR PRIVACY"
    $tempPath = Join-Path -Path $boxPath -ChildPath $filename
    $img.Save($tempPath, [System.Drawing.Imaging.ImageFormat]::Png)

    # save info file
    $infoFile = Join-Path -Path $boxPath -ChildPath "latest.txt"
    Set-Content -Path $infoFile -Value $filename

    # server destination path
    $destination = "REMOVED FOR PRIVACY"    
    # copy image and info file to server
    scp $tempPath $infoFile "$destination"

    Write-Output $filename
} else {
    Write-Output "NO_IMAGE"
}
