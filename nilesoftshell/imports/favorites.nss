$Brave_path = 'C:\Users\Andrey\AppData\Local\BraveSoftware\Brave-Browser\Application\brave.exe'
menu(type='*' where=(sel.count or wnd.is_taskbar or wnd.is_edit) title="Favorites" image=\uE0C8)
{
  menu(title="Universidad" image=\uE0A7)
  {
  	item(title='Moodle' image=\uE0A7 cmd=Brave_path arg="https://moodle.ucenfotec.ac.cr/my/courses.php" )
    item(title='Estructura de datos Moodle' image=\uE141 cmd=Brave_path arg="https://moodle.ucenfotec.ac.cr/course/view.php?id=2123" )
    item(title='Estructura de datos Meet' image=\uE217 cmd=Brave_path arg="https://meet.google.com/aez-ommz-iha?pli=1&authuser=3" )
    item(title='Diseño y Construcción de Componentes Moodle' image=\uE141 cmd=Brave_path arg="https://moodle.ucenfotec.ac.cr/course/view.php?id=2417" )
    item(title='Diseño y Construcción de Componentes Meet' image=\uE217 cmd=Brave_path arg="https://meet.google.com/aez-ommz-iha?pli=1&authuser=3" )
  }
}