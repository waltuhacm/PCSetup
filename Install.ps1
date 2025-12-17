$installers = @(
    @{ Type = "exe"; Path = "Applications\1PasswordSetup-latest.exe"; SilentArgs = "/S"; ManualArgs = "" },
    @{ Type = "msi"; Path = "msiexec"; SilentArgs = "/i Applications\7z2409-x64.msi /qn"; ManualArgs = "/i Applications\7z2409-x64.msi" },
    @{ Type = "exe"; Path = "Applications\DiscordPTBSetup.exe"; SilentArgs = "/S"; ManualArgs = "" },
    @{ Type = "exe"; Path = "Applications\DiscordSetup.exe"; SilentArgs = "/S"; ManualArgs = "" },
    @{ Type = "exe"; Path = "Applications\fdm_x64_setup.exe"; SilentArgs = "/S"; ManualArgs = "" },
    @{ Type = "cmd"; Command = "winget install --id Git.Git -e --source winget" },
    @{ Type = "exe"; Path = "Applications\GitHubDesktopSetup-x64.exe"; SilentArgs = "/VERYSILENT /NORESTART"; ManualArgs = "" },
    @{ Type = "exe"; Path = "Applications\GoogleDriveSetup.exe"; SilentArgs = "/silent /install"; ManualArgs = "" },
    @{ Type = "exe"; Path = "Applications\GrammarlyInstaller.c0000077xboj9n3et0sr0e02.exe"; SilentArgs = "/S"; ManualArgs = "" },
    @{ Type = "exe"; Path = "Applications\Greenshot-INSTALLER-1.2.10.6-RELEASE.exe"; SilentArgs = "/VERYSILENT /NORESTART"; ManualArgs = "" },
    @{ Type = "exe"; Path = "Applications\obs-streamelements-setup-latest.exe"; SilentArgs = "/S"; ManualArgs = "" },
    @{ Type = "exe"; Path = "Applications\parsec-windows.exe"; SilentArgs = "/S"; ManualArgs = "" },
    @{ Type = "exe"; Path = "Applications\PowerToysSetup-0.91.1-x64.exe"; SilentArgs = "/VERYSILENT /NORESTART"; ManualArgs = "" },
    @{ Type = "exe"; Path = "Applications\RazerSynapseInstaller_V1.22.0.737.exe"; SilentArgs = "/S"; ManualArgs = "" },
    @{ Type = "exe"; Path = "Applications\SpotifySetup.exe"; SilentArgs = "/silent"; ManualArgs = "" },
    @{ Type = "exe"; Path = "Applications\SteamSetup.exe"; SilentArgs = "/S"; ManualArgs = "" },
    @{ Type = "exe"; Path = "Applications\TeamViewer_Setup_x64.exe"; SilentArgs = "/S"; ManualArgs = "" },
    @{ Type = "exe"; Path = "Applications\Vivaldi.7.4.3684.43.x64.exe"; SilentArgs = "/silent /install"; ManualArgs = "" },
    @{ Type = "exe"; Path = "Applications\vlc-3.0.21-win64.exe"; SilentArgs = "/S"; ManualArgs = "" },
    @{ Type = "exe"; Path = "Applications\VSCodeSetup-x64-1.100.3.exe"; SilentArgs = "/VERYSILENT /NORESTART"; ManualArgs = "" }
)

foreach ($installer in $installers) {
    if ($installer.Type -eq "exe" -or $installer.Type -eq "msi") {
        $process = Start-Process -FilePath $installer.Path -ArgumentList $installer.SilentArgs -Wait -NoNewWindow -PassThru
        if ($process.ExitCode -ne 0) {
            Write-Host "Silent install failed for $($installer.Path), running manual install."
            Start-Process -FilePath $installer.Path -ArgumentList $installer.ManualArgs -Wait
        }
    } elseif ($installer.Type -eq "cmd") {
        Invoke-Expression $installer.Command
    }
}