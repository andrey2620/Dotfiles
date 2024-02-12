settings
{
	priority=1
	exclude.where = !process.is_explorer
	showdelay = 200
	// Options to allow modification of system items
	modify.remove.duplicate=1
	tip.enabled=true
}

import 'imports/theme.nss'
import 'imports/images.nss'

import 'imports/modify.nss'

menu(mode="multiple" title="Pin/Unpin" image=icon.pin sep=before)
{
}

menu(mode="multiple" title=title.more_options image=icon.more_options sep=after)
{
}

import 'imports/vars.nss'
import 'imports/apps.nss'
import 'imports/favorites.nss'
import 'imports/develop.nss'
import 'imports/directories.nss'
import 'imports/config.nss'
import 'imports/file-manage.nss'
import 'imports/taskbar.nss'