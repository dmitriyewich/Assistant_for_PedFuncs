# Assistant for PedFuncs
![main_screenshot](https://i.imgur.com/xH70lbm.jpg)
Оказывается из PedFuncs можно экспортировать функцию и вручную назначать текстуру. Собственно вот.
Скрипт позволяет узнать текущую текстуру и назначить другую.
❗Отcчет текстур идет с конца, например в чате/рендере bmydj_remap0 равен bmydj_remap(последний) в .txd

Активация:

**Для одиночки:** чит-код 'remap', RMB + Left/Right - _remap, RMB + Up/Down - index

**Для сампа:** /pdremap - RMB + ..., /setremap [id] [index] [_remap](/setremap 174 0 5), /getremap [id] [index](/getremap 174 0)
Ид можно опустить, если нужно изменить/узнать свою текстуру


Требования: MoonLoader 0.26+, PedFuncs, lfs(если этой библиотеки у вас нет скрипт сам её скачает).

Если вы не хотите проверку установлена ли библиотека LuaFileSystem удалите строку ```checklibs()``` и строки с ```function checklibs() ``` до конца.

Установка: для .lua файла - установить в moonloader.
При перезапуске скрипта игра может зависнуть на пару секунд, так как идет поиск PedFuncs.asi

👉🏻Авторы: Junior_Djjr, dmitriyewich

Распространение только с указанием авторов.
