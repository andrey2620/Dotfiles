$Brave_path = 'C:\Users\Andrey\AppData\Local\BraveSoftware\Brave-Browser\Application\brave.exe'
$Discord_path = 'C:\Users\Andrey\AppData\Local\Discord\app-1.0.9032\Discord.exe'
$Epic_Games_path = 'C:\Program Files (x86)\Epic Games\Launcher\Portal\Binaries\Win32\EpicGamesLauncher.exe'
$Everything_path = 'C:\Program Files\Everything\Everything.exe'
$Firefox_path = 'C:\Program Files\Mozilla Firefox\firefox.exe'
$Google_Chrome_path = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
$GooglePlay_path = 'C:\Program Files\Google\Play Games\Bootstrapper.exe'
$Keepass_path = 'D:\apps\KeePass-2.55\KeePass.exe'
$LOL_eng_path = 'C:\Riot Games\League of Legends\lol_eng.lnk' // --locale=en_US
$LOL_esp_path = 'C:\Riot Games\League of Legends\LOL_es.lnk' // --locale=es_MX
$LOL_kr_path = 'C:\Riot Games\League of Legends\LOL_kr.lnk' // --locale=ko_KR
$MSI_Afterburn_path = 'C:\Program Files (x86)\MSI Afterburner\MSIAfterburner.exe'
$Obsidian_path = 'C:\Users\Andrey\AppData\Local\Obsidian\Obsidian.exe'
$Spotify_path = 'C:\Users\Andrey\AppData\Roaming\Spotify\Spotify.exe'

menu(type ='*' where=(sel.count or wnd.is_taskbar or wnd.is_edit) sep=before title="Apps" image=\uE26B)
{
  item(title='Brave' image=Brave_path cmd=Brave_path)
  item(title='Discord' image=Discord_path cmd=Discord_path)
  item(title='Epic Games' image=Epic_Games_path cmd=Epic_Games_path)
  item(title='Everything' image=Everything_path cmd=Everything_path)
  item(title='Firefox' image=Firefox_path cmd=Firefox_path)
  item(title='Google Chrome' image=Google_Chrome_path cmd=Google_Chrome_path)
  item(title='GooglePlay' image=GooglePlay_path cmd=GooglePlay_path)
  item(title='Keepass' image=Keepass_path cmd=Keepass_path)
  item(title='LOL eng' image=LOL_eng_path cmd=LOL_eng_path)
  item(title='LOL esp' image=LOL_esp_path cmd=LOL_esp_path)
  item(title='LOL kr' image=LOL_kr_path cmd=LOL_kr_path)
  item(title='MSI Afterburn' image=MSI_Afterburn_path cmd=MSI_Afterburn_path)
  item(title='Obsidian' image=Obsidian_path cmd=Obsidian_path)
  item(title='Spotify' image=Spotify_path cmd=Spotify_path)
}