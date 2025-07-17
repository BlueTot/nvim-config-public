# Load necessary .NET types
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

if ([Windows.Forms.Clipboard]::ContainsImage()) {
    $img = [Windows.Forms.Clipboard]::GetImage()

    # Adjust the WSL path and Windows version of the path here
    $wslPath = "REMOVED FOR PRIVACY"
    $filename = "img_{0:yyyyMMdd_HHmmss}.png" -f (Get-Date)
    $fileWinPath = Join-Path $wslPath $filename

    # Save image
    $img.Save($fileWinPath, [System.Drawing.Imaging.ImageFormat]::Png)
    Write-Output $filename
} else {
    Write-Output "NO_IMAGE"
}
