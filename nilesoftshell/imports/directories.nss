menu(type ='*' where=(sel.count or wnd.is_taskbar or wnd.is_edit) title="Directorios" image=\uE0CA)
{
	item(title='@user.name@@@sys.name' vis=label)
  item(title='GitHub' image=inherit cmd='C:\Users\Andrey\Documents\GitHub')
  item(title='Apps' image=inherit cmd='D:\apps')
  item(title='IdeaProjects' image=inherit cmd='C:\Users\Andrey\Documents\GitHub\IdeaProjects')
  item(title='Shell' image=inherit cmd='D:\apps\Nilesoft Shell')
  item(title='$PROFILE' image=inherit cmd='C:\Users\Andrey\Documents\PowerShell')
  item(title='.Minecraft' image=inherit cmd='C:\Users\Andrey\AppData\Roaming\.minecraft')
  item(title='AppData' image=inherit cmd='C:\Users\Andrey\AppData\Roaming')
	item(title='Downloads' image=inherit cmd=user.downloads)
	item(title='Desktop' image=inherit cmd=user.desktop)
	item(title='Documents' image=inherit cmd=user.documents)
	separator
	item(title='Program Files' image=inherit cmd=sys.prog)
	item(title='Program Files x86' image=inherit cmd=sys.prog32)
	item(title='ProgramData' image=inherit cmd=sys.programdata)
	item(title='Applications' image=inherit cmd='shell:appsfolder')
	item(title='Users' image=inherit cmd=sys.users)
}