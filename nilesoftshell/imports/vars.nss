//apss
$Brave_path = 'C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe'
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
$Minecraft_path = 'C:\Users\Andrey\Desktop\Minecraft.lnk'
$Obsidian_path = 'C:\Users\Andrey\AppData\Local\Obsidian\Obsidian.exe'
$Spotify_path = 'C:\Users\Andrey\AppData\Roaming\Spotify\Spotify.exe'
$Thunderstore_path = 'C:\Users\Andrey\Desktop\Thunderstore.lnk'
$Whatsapp_path = 'C:\Program Files\WindowsApps\5319275A.51895FA4EA97F_2.2405.6.0_x64__cv1g1gvanyjgm\WhatsApp.exe'

//develop
$GitHub_Desktop_path = 'C:\Users\Andrey\AppData\Local\GitHubDesktop\GitHubDesktop.exe'
$VS_Code_path = 'C:\Users\Andrey\AppData\Local\Programs\Microsoft VS Code\Code.exe'
$Intelij_path =  'C:\Program Files\JetBrains\IntelliJ IDEA 2023.3.3\bin\idea64.exe'
$Visual_Studio_path = 'C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\devenv.exe'
$Sql_Server_path = 'C:\Program Files (x86)\Microsoft SQL Server Management Studio 19\Common7\IDE\Ssms.exe'
$Postman_path = 'C:\Users\Andrey\AppData\Local\Postman\Postman.exe'

//img
$Thunderstore_img = 'D:\apps\Nilesoft Shell\img\thunderstore.png'
$Minecraft_img = 'C:\XboxGames\Minecraft Launcher\Content\SmallLogo.contrast-white_altform-unplated_targetsize-256.png'
$LOL_img = 'C:\Riot Games\League of Legends\LeagueClient.exe'

//con Shift abre terminal como admin
$has_admin=key.shift() or key.rbutton()

$html = io.file.read('D:\apps\Nilesoft Shell\imports\Code-Templates\HtmlTemplate.html')