
#!/bin/bash

# Установка git
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
        exit 1
        ;;
esac

echo "Установка WEG™ mod"

if [ "$MOBOX" = "WoW64" ]; then
    # Копирование файлов
    cp "$HOME/Mobox-mod-wiget/auto-link-kreator" /data/data/com.termux/files/home/bin/
    cp "$HOME/Mobox-mod-wiget/link-source-code-run" /data/data/com.termux/files/home/bin/
    cp "$HOME/Mobox-mod-wiget/weg-mod" /data/data/com.termux/files/home/glibc/opt/scripts/
    cp "$HOME/Mobox-mod-wiget/weg-mod-menu" /data/data/com.termux/files/home/glibc/opt/scripts/
    cp "$HOME/Mobox-mod-wiget/weg-mod-start" /data/data/com.termux/files/home/glibc/opt/scripts/
    cp "$HOME/Mobox-mod-wiget/watch_script.log" "$HOME/tmp/"

    # Создание символической ссылки
    ln -sf /data/data/com.termux/files/home/glibc/opt/scripts/weg-mod /data/data/com.termux/files/home/bin/weg-mod

    # Изменение прав доступа на файлы
    chmod +x /data/data/com.termux/files/home/bin/auto-link-kreator
    chmod +x /data/data/com.termux/files/home/bin/link-source-code-run
    chmod +x /data/data/com.termux/files/home/glibc/opt/scripts/weg-mod
    chmod +x /data/data/com.termux/files/home/glibc/opt/scripts/weg-mod-menu
    chmod +x /data/data/com.termux/files/home/glibc/opt/scripts/weg-mod-start
    chmod +x "$HOME/tmp/watch_script.log"
    chmod +x /data/data/com.termux/files/home/bin/weg-mod

    # Удаление папки Mobox-mod-wiget
    rm -rf "$HOME/Mobox-mod-wiget"

    echo "Все операции завершены успешно."
fi







echo "Установка WEG™ mod"

if [ "$MOBOX" = "X86" ]; then
    # Копирование файлов
    cp "$HOME/Mobox-mod-wiget/auto-link-kreator" /data/data/com.termux/files/home/bin/
    cp "$HOME/Mobox-mod-wiget/link-source-code-run-x86" /data/data/com.termux/files/home/bin/link-source-code-run
    cp "$HOME/Mobox-mod-wiget/weg-mod-x86" /data/data/com.termux/files/home/glibc/opt/scripts/weg-mod
    cp "$HOME/Mobox-mod-wiget/weg-mod-menu-x86" /data/data/com.termux/files/home/glibc/opt/scripts/weg-mod-menu
    cp "$HOME/Mobox-mod-wiget/weg-mod-start-x86" /data/data/com.termux/files/home/glibc/opt/scripts/weg-mod-start
    cp "$HOME/Mobox-mod-wiget/watch_script.log" "$HOME/tmp/"

    # Создание символической ссылки
    ln -sf /data/data/com.termux/files/home/glibc/opt/scripts/weg-mod /data/data/com.termux/files/home/bin/weg-mod

    # Изменение прав доступа на файлы
    chmod +x /data/data/com.termux/files/home/bin/auto-link-kreator
    chmod +x /data/data/com.termux/files/home/bin/link-source-code-run
    chmod +x /data/data/com.termux/files/home/glibc/opt/scripts/weg-mod
    chmod +x /data/data/com.termux/files/home/glibc/opt/scripts/weg-mod-menu
    chmod +x /data/data/com.termux/files/home/glibc/opt/scripts/weg-mod-start
    chmod +x "$HOME/tmp/watch_script.log"
    chmod +x /data/data/com.termux/files/home/bin/weg-mod

    # Удаление папки Mobox-mod-wiget
    rm -rf "$HOME/Mobox-mod-wiget"

    echo "Все операции завершены успешно."
fi
