menu(where=sel.count>0 type='file|dir|drive|namespace|back' mode="multiple" title="Copy Path" image=icon.copy_path)
{
	item(where=sel.count > 1 title='Copy (@sel.count) items selected' cmd=command.copy(sel(false, "\n")))
	item(mode="single" title=@sel.path tip=sel.path cmd=command.copy(sel.path))
	item(mode="single" type='file' separator="before" find='.lnk' title='open file location')
	separator
	item(mode="single" where=@sel.parent.len>3 title=sel.parent cmd=@command.copy(sel.parent))
	separator
	item(mode="single" type='file|dir|back.dir' title=sel.file.name cmd=command.copy(sel.file.name))
	item(mode="single" type='file' where=sel.file.len != sel.file.title.len title=@sel.file.title cmd=command.copy(sel.file.title))
	item(mode="single" type='file' where=sel.file.ext.len>0 title=sel.file.ext cmd=command.copy(sel.file.ext))
}
menu(where=sel.count>0 type='file|dir|drive|namespace|back' mode="multiple" sep=after title='New File' image=icon.new_file)
{
	$dt = sys.datetime("mdHMSsy")
	item(title='HTML' cmd=io.file.create('@(dt).html', html))
	item(title='JSON' cmd=io.file.create('@(dt).json', '[]'))
}
