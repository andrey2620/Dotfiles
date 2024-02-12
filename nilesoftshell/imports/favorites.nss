menu(type='*' where=(sel.count or wnd.is_taskbar or wnd.is_edit) title="Favorites" image=\uE124)
{
  item(title='Whatsapp' image=\uE246 cmd=Whatsapp_path)
  item(title='Brave' image=Brave_path cmd=Brave_path)
  item(title='Discord' image=Discord_path cmd=Discord_path)
  item(title='LOL' image=LOL_img cmd=LOL_eng_path)
  item(title='Keepass' image=Keepass_path cmd=Keepass_path)
  item(title='Obsidian' image=Obsidian_path cmd=Obsidian_path)
  item(title='Spotify' image=Spotify_path cmd=Spotify_path)
  item(title='Youtube' image=\uE248 cmd=Brave_path arg="https://youtube.com" )
  item(title='Facebook' image=\uE244 cmd=Brave_path arg="https://facebook.com" )
  item(title='Instagram' image='D:\apps\Nilesoft Shell\img\instagram.png' cmd=Brave_path arg="https://instagram.com" )
  item(title='Tiktok' image='D:\apps\Nilesoft Shell\img\tik-tok.png' cmd=Brave_path arg="https://tiktok.com" )
  separator
  menu(title="Universidad" image=\uE0A7)
  {
  	item(title='Moodle' image=\uE0A7 cmd=Brave_path arg="https://moodle.ucenfotec.ac.cr/my/courses.php" )
  	item(title='Tickets' image=\uE0A7 cmd=Brave_path arg="https://centrodeasistencia.ucenfotec.ac.cr/portal/es/signin" )
  	item(title='Campus' image=\uE0A7 cmd=Brave_path arg="https://campus.ucenfotec.ac.cr/ss/Home.aspx" )
    item(title='Estructura de datos Moodle' image=\uE141 cmd=Brave_path arg="https://moodle.ucenfotec.ac.cr/course/view.php?id=2123" )
    item(title='Estructura de datos Meet' image=\uE217 cmd=Brave_path arg="https://meet.google.com/aez-ommz-iha?pli=1&authuser=3" )
    item(title='Diseño y Construcción de Componentes Moodle' image=\uE141 cmd=Brave_path arg="https://moodle.ucenfotec.ac.cr/course/view.php?id=2417" )
    item(title='Diseño y Construcción de Componentes Meet' image=\uE217 cmd=Brave_path arg="https://meet.google.com/uat-giko-dyp?pli=1&authuser=3" )
  }
  menu(title="Correos" image=\uE115)
  {
  	item(title='lopendex' image=\uE105 cmd=Brave_path arg="https://mail.google.com/mail/u/1/#inbox" )
    item(title='andrey26cr' image=\uE105 cmd=Brave_path arg="https://mail.google.com/mail/u/0/#inbox" )
    item(title='guillermina' image=\uE105 cmd=Brave_path arg="https://mail.google.com/mail/u/4/#inbox" )
    item(title='avg2620' image=\uE105 cmd=Brave_path arg="https://mail.google.com/mail/u/2/#inbox" )
    item(title='rvillalobosg' image=\uE105 cmd=Brave_path arg="https://mail.google.com/mail/u/3/#inbox" )
    item(title='sugeldy' image=\uE105 cmd=Brave_path arg="https://login.live.com/" )
  }
}