### Подготовка

Изучите команды `find`, `xargs`, и `grep` с помощью команды `man`.

### Задания

Используя команду `find`:

1. Найдите все файлы и каталоги, имя которых содержит слово `pass`, поиск начните с корневого каталога.

find / -name "*pass*" 2>/dev/null 
/run/systemd/ask-password
/sys/fs/selinux/class/passwd
/sys/fs/selinux/class/passwd/perms/passwd
/home/pavel/passwd
/home/pavel/passwd_link
/home/pavel/scripts/passwd
...

1. Найдите все файлы и каталоги, имя которых содержит слово `pass` без учёта регистра, поиск начните с корневого каталога.

find / -iname "*pass*" 2>/dev/null 
/run/systemd/ask-password
/sys/fs/selinux/class/passwd
/sys/fs/selinux/class/passwd/perms/passwd
/home/pavel/passwd
/home/pavel/passwd_link
/home/pavel/scripts/passwd
/home/pavel/Passwd
...


1. Найдите все файлы и каталоги, имя которых содержит слово `pass`, ограничив глубину поиска одним каталогом, поиск начните с корневого каталога.

find / -maxdepth 1 -name "*pass*" 2>/dev/null 
...

1. Найдите все файлы и каталоги, имена которых оканчиваются на `.bin`. Поиск необходимо выполнить в каталоге `/home`.

find /home -name "*.bin"  2>/dev/null
/home/pavel/.gstreamer-0.10/registry.x86_64.bin
/home/pavel/test.bin



1. Найдите все **файлы** (и только файлы) с расширением `bak` и удалите их.
find / -type f -name "*.bak" -printf "%f\n" -delete 2>/dev/null
nsswitch.conf.bak
recovery.bak
log.bak
bookmarks.xml.bak
a.bak


1. Найдите все **файлы** (и только файлы) с расширениями `txt` и `sh`.
find . -type f -name "*.sh" -o -name "*.txt"
./.mozilla/firefox/iw1j5xlt.default/SiteSecurityServiceState.txt
./scripts/2.5.sh
./scripts/t.sh
./scripts/play.sh
...


1. Найдите все **файлы** (и только файлы) в текущем каталоге и выведите **только** имя файла (без каталога), владельца, группу владельца, количество жёстких ссылок на этот файл и его размер в байтах.
find . -type f -printf "%f %u %g %n %s\n" 
messages.json pavel pavel 1 114
klipperrc pavel pavel 1 116
oxygenrc pavel pavel 1 93
dolphinrc pavel pavel 1 702
kded_device_automounterrc pavel pavel 1 330
...
 

1. Найдите все пустые **каталоги** в текущем каталоге.
find . -maxdepth 1 -type d -empty 
./Рабочий стол
./Шаблоны
./Общедоступные
./Документы
./Музыка
./Изображения
./Видео
./history.txt
./fruits
./hello


1. Найдите все пустые **каталоги** в текущем каталоге и удалите их.
find . -maxdepth 1 -type d -empty -delete


1. Найдите и удалите все пустые **файлы** (и только файлы).
find . -maxdepth 1 -type f -empty -delete


1. Найдите все **файлы** (и только файлы) в текущем каталоге, на которые есть хотя бы одна жёсткая ссылка.
find . -type f -not -links 0


1. Найдите файлы и каталоги в каталоге `/etc`, **не** принадлежащие пользователю `root`.
find /etc -not -user root
/etc/polkit-1/rules.d
/etc/tcsd.conf
/etc/sssd
/etc/sssd/conf.d


1. Найдите все **файлы** (и только файлы), у которых **нет** расширения `sh`.
find / -type f -not -name "*.sh"
...

1. Найдите все **файлы** (и только файлы), у которых количество жёстких ссылок более двух.
find . -type f -not -links 0 -not -links 1 -not -links 2 

1. Найдите все **файлы** (и только файлы) в каталоге `/usr/bin`, последний доступ к которым осуществлялся более трёх месяцев назад.
find /usr/bin -maxdepth 1 -type f -atime +92


1. Найдите все **файлы** (и только файлы) в каталогах `/usr/bin` и `/usr/share`, созданные или изменённые в течении последних 10 дней.
find /usr/bin /usr/share -type f -mtime 10


1. Найдите и удалите все **файлы** (и только файлы) в каталоге `/tmp`, которые не менялись более двух недель.
find /tmp -type f -mtime +14 2>/dev/null


1. Найдите все **файлы** (и только файлы) в каталоге `/usr/bin` с установленным флагом suid/sgid.
find / -type f -perm -u=s,g=s  2>/dev/null 
/usr/libexec/abrt-action-install-debuginfo-to-abrt-cache



Используя команды `find` и `xargs` или параметр `-exec` команды `find`:

1. Найдите все **файлы** (и только файлы) с расширением `txt` и подсчитайте количество строк во всех этих файлах.
find / -type f -name "*.txt" 2>/dev/null | xargs wc -l
1043753 итого


1. Найдите все каталоги с названием `.svn` и удалите их, включая содержимое этих каталогов, попутно выводя список удалённых файлов на экран.
find / -type d -name  ".svn" -exec rm -r {} \; 2>/dev/null


1. Найдите все **файлы** (и только файлы) с расширением `sh` и добавьтем им право на исполнение.
find / -type f -name "*.sh" 2>/dev/null | xargs chmod ugo+x
find / -type f -name "*.sh" -exec chmod ugo+x {} \; 2>/dev/null


1. Найдите все **файлы** (и только файлы) с расширением `conf` в каталоге `/etc` и подсчитайте их суммарный размер, используя команду du.
find /etc -type f -name "*.conf" | xargs du -ch 
...
1,3M    итого


Протестируйте команды, которые вы написали выше, для файлов и каталогов, в именах которых содержатся пробелы и специальные символы, такие как `!` и `&`.

Используя команду `grep`:

1. Из файла `/var/log/messages` вывести строки, содержащие ключевое слово `ERROR`, без учёта регистра.
grep -i "error" /var/log/messages
Nov  7 19:21:46 localhost org.kde.kuiserver: kuiserver: Fatal IO error: client killed
Nov  7 19:21:46 localhost com.redhat.imsettings: [ 1541607706.731959]: GLib-GIO[1695]: CRITICAL **: Error while sending AddMatch() message: The connection is closed
...


1. Из файла `/var/log/messages` вывести **количество** строк, **не** содержащих ключевое слово `ERROR`, без учёта регистра.
grep -ivc "error" /var/log/messages
2190

1. Из файла `/var/log/messages` вывести строки, содержащие **только слово `ERROR` целиком**, с учётом регистра.
grep -w "ERROR" /var/log/messages

1. Вывести количество строк из файла `/etc/group`, совпадающих с шаблоном `wheel`.
grep -wc "wheel" /etc/group
1

1. Найти во всех файлах из текущего каталога и вложенных подкаталогов строки, содержащие шаблон `#!bin/bash`.
grep -rh "\#\!/bin/bash" .


1. Изменить предыдущую команду таким образом, чтобы она выводила дополнительные 10 строк после каждого найденного шаблона.
grep -rh -A10 "\#\!/bin/bash" .

1. Найти во всех файлах с расширением `sh` из текущего каталога и вложенных подкаталогов строки, содержащие слово `echo` **целиком**. В выводе команды `grep` найденные слова выделите цветом.
grep -rwh --color "echo" *.sh

1. Измените предыдущую команду таким образом, чтобы команда grep отображала также имя файла и номер строки, в которой было обнаружено совпадение с шаблоном.
grep -rwn --color "echo" *.sh


# Отчёт по лабораторной работе

Скопируйте данную лабораторную работу в виде файла Markdown на свой компьютер, и под каждым заданием напишите ответ.

```sh
git clone https://github.com/efanov/mephi.wiki.git
```

Получившийся файл загрузите в собственный репозиторий.
