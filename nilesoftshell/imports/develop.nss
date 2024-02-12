menu(type='*' where=(sel.count or wnd.is_taskbar or wnd.is_edit) title="Develop" image=\uE26E)
{
  item(title='GitHub' image=\uE22C cmd=Brave_path arg="https://github.com/andrey2620?tab=repositories" )
  item(title='ChatGpt' image='D:\apps\Nilesoft Shell\img\chatgpt.png' cmd=Brave_path arg="https://chat.openai.com/" )
  item(title='PerplexityAI' image=\uE22C cmd=Brave_path arg="https://www.perplexity.ai/" )
	item(title='Obsidian' image=Obsidian_path cmd=Obsidian_path)

  separator

	item(title='GitHub Desktop' image=GitHub_Desktop_path cmd=GitHub_Desktop_path)
	item(title='VS Code' image=VS_Code_path cmd=VS_Code_path)
	item(title='Intelij' image=Intelij_path cmd=Intelij_path)
	item(title='Visual Studio' image=Visual_Studio_path cmd=Visual_Studio_path)
	item(title='Sql Server' image=Sql_Server_path cmd=Sql_Server_path)
	item(title='Postman' image=Postman_path cmd=Postman_path)

  separator

	item(where=package.exists("WindowsTerminal") title="Powershell" admin=has_admin image=\uE218 cmd='wt.exe' arg='-d "@sel.path\."')
	item(where=package.exists("WindowsTerminal") title="Show Menu" admin=has_admin image=\uE218 cmd='C:\Program Files\PowerShell\7\dev.exe.lnk')
}