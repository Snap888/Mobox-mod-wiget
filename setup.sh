#!/bin/bash

# Установка необходимых пакетов
if apt update && apt install -y git inotify-tools; then
    echo "Пакеты успешно установлены."
else
    echo "Ошибка при установке пакетов."
    exit 1
fi

# Клонирование репозитория
cd ~
if git clone https://github.com/Snap888/Mobox-mod-wiget; then
    echo "Репозиторий успешно клонирован."
else
    echo "Ошибка при клонировании репозитория."
    exit 1
fi

# Создание директорий
mkdir -p "$HOME/tmp" && echo "Создана директория tmp."
mkdir -p "$HOME/Desktop" && echo "Создана директория Desktop."
mkdir -p /data/data/com.termux/files/home/.shortcuts && echo "Создана директория .shortcuts."
chmod 700 -R /data/data/com.termux/files/home/.shortcuts && echo "Права доступа к .shortcuts изменены."
mkdir -p /data/data/com.termux/files/home/.shortcuts/tasks && echo "Создана директория tasks."
chmod 700 -R /data/data/com.termux/files/home/.shortcuts/tasks && echo "Права доступа к tasks изменены."

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
    cp "$HOME/Mobox-mod-wiget/auto-link-kreator" "$PREFIX/bin/" && echo "Копирован auto-link-kreator."
    cp "$HOME/Mobox-mod-wiget/link-source-code-run" "$PREFIX/bin/" && echo "Копирован link-source-code-run."
    cp "$HOME/Mobox-mod-wiget/weg-mod" "$PREFIX/glibc/opt/scripts/" && echo "Копирован weg-mod."
    cp "$HOME/Mobox-mod-wiget/weg-mod-menu" "$PREFIX/glibc/opt/scripts/" && echo "Копирован weg-mod-menu."
    cp "$HOME/Mobox-mod-wiget/weg-mod-start" "$PREFIX/glibc/opt/scripts/" && echo "Копирован weg-mod-start."
else
    cp "$HOME/Mobox-mod-wiget/auto-link-kreator" "$PREFIX/bin/" && echo "Копирован auto-link-kreator."
    cp "$HOME/Mobox-mod-wiget/link-source-code-run-x86" "$PREFIX/bin/" && echo "Копирован link-source-code-run-x86."
    cp "$HOME/Mobox-mod-wiget/weg-mod-x86" "$PREFIX/glibc/opt/scripts/" && echo "Копирован weg-mod-x86."
    cp "$HOME/Mobox-mod-wiget/weg-mod-menu-x86" "$PREFIX/glibc/opt/scripts/" && echo "Копирован weg-mod-menu-x86."
    cp "$HOME/Mobox-mod-wiget/weg-mod-start-x86" "$PREFIX/glibc/opt/scripts/" && echo "Копирован weg-mod-start-x86."
fi

cp "$HOME/Mobox-mod-wiget/watch_script.log" "$HOME/tmp/" && echo "Копирован watch_script.log."

# Создание символической ссылки
ln -sf "$PREFIX/glibc/opt/scripts/weg-mod" "$PREFIX/bin/weg-mod" && echo "Создана символическая ссылка weg-mod."

# Изменение прав доступа на файлы
chmod +x "$PREFIX/bin/auto-link-kreator" && echo "Права доступа для auto-link-kreator изменены."
chmod +x "$PREFIX/bin/link-source-code-run" && echo "Права доступа для link-source-code-run изменены."
chmod +x "$PREFIX/glibc/opt/scripts/weg-mod" && echo "Права доступа для weg-mod изменены."
chmod +x "$PREFIX/glibc/opt/scripts/weg-mod-menu" && echo "Права доступа для weg-mod-menu изменены."
chmod +x "$PREFIX/glibc/opt/scripts/weg-mod-start" && echo "Права доступа для weg-mod-start изменены."
chmod +x "$HOME/tmp/watch_script.log" && echo "Права доступа для watch_script.log изменены."
chmod +x "$PREFIX/bin/weg-mod" && echo "Права доступа для weg-mod изменены."

# Удаление папки Mobox-mod-wiget
rm -rf "$HOME/Mobox-mod-wiget" && echo "Папка Mobox-mod-wiget удалена."

echo "Все операции завершены успешно."