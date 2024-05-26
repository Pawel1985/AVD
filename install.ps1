#feature 2
[cmdLetBinding()]


param(
     [string]$saName,
     [string]$shareName,
     [string]$username,
     [string]$saKey,
     [string]$zipVersion,
     [string]$AdobeDCVersion,
     [string]$NppVersion,
     [string]$ChromeVersion,
     [string]$FuzeVersion,
     [string]$IETABVersion,
     [string]$SEPVersion,
     [string]$HaysTemplatesVersion,
     [string]$MDIVersion,
     [string]$EDMVersion,
     [string]$AdobeProVersion,
     [string]$WhiteboardVersion,
     [string]$ToDoVersion
)

net use x: \\$saName.file.core.windows.net\$shareName /user:Azure\$username $saKey

Copy-Item -Path x:\WVDScripts\WVDImageHelpers\ -Destination 'C:\Program Files\WindowsPowerShell\Modules' -Recurse
copy-item -Path x:\WVDScripts\Virtual-Desktop-Optimization-Tool-main -Destination c:\ -Recurse
Copy-Item -Path x:\WVDScripts\Installers -Destination c:\Apps\ -Recurse
Copy-Item x:\WVDScripts\Enable-DeveloperMode.ps1 -Destination C:\Apps
Copy-Item x:\WVDScripts\Update-Hosts.ps1 -Destination C:\Apps


C:\Virtual-Desktop-Optimization-Tool-main\Win10_VirtualDesktop_Optimize.ps1 -WindowsVersion 2009 -Optimizations All -Restart:$false

cd c:\apps

C:\Apps\Install-AppsFolder.ps1
C:\Apps\Install-BgInfo.ps1
C:\Apps\Install-7zip.ps1 -Version $zipVersion
C:\Apps\Install-AdobeReaderDC.ps1 -Version $AdobeDCVersion
C:\Apps\Install-Notepad.ps1 -Version $NppVersion
C:\Apps\Install-GoogleChrome.ps1 -Version $ChromeVersion
C:\Apps\Install-Fuze.ps1 -Version $FuzeVersion
C:\Apps\Install-IETab.ps1 -Version $IETABVersion
C:\Apps\Install-SEP -Version $SEPVersion
C:\Apps\Install-O365Shortcuts.ps1
C:\Apps\Install-HaysTemplates.ps1 -Version $HaysTemplatesVersion
C:\Apps\Install-MDIFileConverter.ps1 -Version $MDIVersion
C:\Apps\Install-EDM.ps1 -Version $EDMVersion
C:\Apps\Install-AdobeDCPro.ps1 -Version $AdobeProVersion
C:\Apps\Enable-DeveloperMode.ps1
C:\Apps\Update-Hosts.ps1
C:\Apps\Install-Whiteboard.ps1 -Version $WhiteboardVersion
C:\Apps\Install-ToDo.ps1 -Version $ToDoVersion

shutdown -r -t 0
