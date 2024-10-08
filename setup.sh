#!/bin/bash

# Установка git
apt install -y git
pkg install inotify-tools -y
# Клонирование репозитория
cd ~
git clone https://github.com/Snap888/Mobox-mod-wiget

# Создание директорий
mkdir -p "$HOME/tmp"
mkdir -p "$HOME/.shortcuts"

# Копирование файлов
cp "$HOME/Mobox-mod-wiget/auto-link-kreator" "$PREFIX/bin/"
cp "$HOME/Mobox-mod-wiget/link-source-code-run" "$PREFIX/bin/"
cp "$HOME/Mobox-mod-wiget/weg-mod" "$PREFIX/glibc/opt/scripts/"
cp "$HOME/Mobox-mod-wiget/weg-mod-menu" "$PREFIX/glibc/opt/scripts/"
cp "$HOME/Mobox-mod-wiget/weg-mod-start" "$PREFIX/glibc/opt/scripts/"
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