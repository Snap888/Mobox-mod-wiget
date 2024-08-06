#!/bin/bash

# Установка необходимых пакетов
apt install -y git
pkg install inotify-tools -y

# Клонирование репозитория
cd ~
git clone https://github.com/Snap888/Mobox-mod-wiget

# Создание директорий
mkdir -p "$HOME/tmp"
mkdir -p "$HOME/Desktop"
mkdir -p /data/data/com.termux/files/home/.shortcuts
chmod 700 -R /data/data/com.termux/files/home/.shortcuts
mkdir -p /data/data/com.termux/files/home/.shortcuts/tasks
chmod 700 -R /data/data/com.termux/files/home/.shortcuts/tasks

# Выбор опции установки
echo "Опции выбора"
echo "1) Установить Mod WEG™ для mobox box86"
echo "2) Установить Мод WEG™ для mobox WoW64"
echo ""
echo -n "Введите номер: "
read i

case "$i" in
    1)
        MOBOX=X86
        ;;
    2)
        MOBOX=WoW64
        ;;
    *)
        echo "Неверный выбор. Завершение."
        exit 1
        ;;
esac

echo "Установка WEG™ mod"

# Копирование файлов в зависимости от выбора пользователя
if [ "$MOBOX" = "WoW64" ]; then
    cp "$HOME/Mobox-mod-wiget/auto-link-kreator" "$PREFIX/bin/"
    cp "$HOME/Mobox-mod-wiget/link-source-code-run" "$PREFIX/bin/"
    cp "$HOME/Mobox-mod-wiget/weg-mod" "$PREFIX/glibc/opt/scripts/"
    cp "$HOME/Mobox-mod-wiget/weg-mod-menu" "$PREFIX/glibc/opt/scripts/"
    cp "$HOME/Mobox-mod-wiget/weg-mod-start" "$PREFIX/glibc/opt/scripts/"
else
    cp "$HOME/Mobox-mod-wiget/auto-link-kreator" "$PREFIX/bin/"
    cp "$HOME/Mobox-mod-wiget/link-source-code-run-x86" "$PREFIX/bin/"
    cp "$HOME/Mobox-mod-wiget/weg-mod-x86" "$PREFIX/glibc/opt/scripts/"
    cp "$HOME/Mobox-mod-wiget/weg-mod-menu-x86" "$PREFIX/glibc/opt/scripts/"
    cp "$HOME/Mobox-mod-wiget/weg-mod-start-x86" "$PREFIX/glibc/opt/scripts/"
fi

cp "$HOME/Mobox-mod-wiget/watch_script.log" "$HOME/tmp/"

# Создание символической ссылки
ln -sf "$PREFIX/glibc/opt/scripts/weg-mod" "$PREFIX/bin/weg-mod"

# Изменение прав доступа на файлы
chmod +x "$PREFIX/bin/auto-link-kreator"
chmod +x "$PREFIX/bin/link-source-code-run"
chmod +x "$PREFIX/glibc/opt/scripts/weg-mod"
chmod +x "$PREFIX/glibc/opt/scripts/weg-mod-menu"
chmod +x "$PREFIX/glibc/opt/scripts/weg-mod-start"
chmod +x "$HOME/tmp/watch_script.log"
chmod +x "$PREFIX/bin/weg-mod"

# Удаление папки Mobox-mod-wiget
rm -rf "$HOME/Mobox-mod-wiget"

echo "Все операции завершены успешно."