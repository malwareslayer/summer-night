#!/usr/bin/env sh

# Cursor
hyprctl setcursor "$(jq -r .themes.cursor ~/.config/hypr/themes/summer-night/config.json)" 14
# ===================


# Monitor
hyprctl keyword monitor, highres, auto, 1
# ===================


# Workspace
hyprctl keyword workspace "$(xrandr | grep -w connected | awk -F '[ +]' '{ print $1 }' | head -n 1)",1
# ===================


# Hyprpaper
killall hyprpaper

echo "preload = $HOME/.config/hypr/hyprpaper/wallpapers/summer-night.png" > "$HOME"/.config/hypr/hyprpaper/summer-night.conf

xrandr | grep -w connected | awk -F '[ +]' '{ print $1 }' | while read -r name; do
  echo "wallpaper = $name,$HOME/.config/hypr/hyprpaper/wallpapers/summer-night.png" >> "$HOME"/.config/hypr/hyprpaper/summer-night.conf
done

hyprpaper --config ~/.config/hypr/hyprpaper/summer-night.conf > /tmp/hyprpaper.log 2>&1 &
# ===================

# Waybar
killall waybar

sed -i -E 's/("output": ")(.*)(",)/\1'"$(xrandr | grep -w connected | awk -F '[ +]' '{ print $1 }' | head -n 1)"'\3/g' ~/.config/waybar/config

waybar --config ~/.config/waybar/config --style ~/.config/waybar/style.css > /tmp/waybar.log 2>&1 &
# ===================

# Dunst
killall dunst

dunst -config ~/.config/dunst/dunstrc.conf > /tmp/dunst.log 2>&1 &
# ===================


# Settings gnome
gsettings set org.gnome.desktop.wm.preferences theme "$(jq -r .themes.gtk ~/.config/hypr/themes/summer-night/config.json)"

gsettings set org.gnome.desktop.interface cursor-theme "$(jq -r .themes.cursor ~/.config/hypr/themes/summer-night/config.json)"
gsettings set org.gnome.desktop.interface gtk-theme "$(jq -r .themes.gtk ~/.config/hypr/themes/summer-night/config.json)"
gsettings set org.gnome.desktop.interface icon-theme "$(jq -r .themes.icon ~/.config/hypr/themes/summer-night/config.json)"
gsettings set org.gnome.desktop.interface font-name "$(jq -r .themes.font ~/.config/hypr/themes/summer-night/config.json)"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
# ===================


# GTK 2.0
sed --in-place "s/gtk-cursor-theme-name = .*/gtk-cursor-theme-name = \"$(jq -r .themes.cursor ~/.config/hypr/themes/summer-night/config.json)\"/" ~/.gtkrc-2.0
sed --in-place "s/gtk-theme-name = .*/gtk-theme-name = \"$(jq -r .themes.gtk ~/.config/hypr/themes/summer-night/config.json)\"/" ~/.gtkrc-2.0
sed --in-place "s/gtk-icon-theme-name = .*/gtk-icon-theme-name = \"$(jq -r .themes.icon ~/.config/hypr/themes/summer-night/config.json)\"/" ~/.gtkrc-2.0
sed --in-place "s/gtk-font-name = .*/gtk-font-name = \"$(jq -r .themes.font ~/.config/hypr/themes/summer-night/config.json) 13\"/" ~/.gtkrc-2.0
# ===================


# GTK 3.0
cp -rf /usr/share/themes/"$(jq -r .themes.gtk ~/.config/hypr/themes/summer-night/config.json)"/gtk-3.0/* ~/.config/gtk-3.0/ || cp -rf ~/.themes/"$(jq -r .themes.gtk ~/.config/hypr/themes/summer-night/config.json)"/gtk-3.0/* ~/.config/gtk-3.0/

sed --in-place "s/gtk-cursor-theme-name = .*/gtk-cursor-theme-name = \"$(jq -r .themes.cursor ~/.config/hypr/themes/summer-night/config.json)\"/" ~/.config/gtk-3.0/settings.ini
sed --in-place "s/gtk-theme-name = .*/gtk-theme-name = \"$(jq -r .themes.gtk ~/.config/hypr/themes/summer-night/config.json)\"/" ~/.config/gtk-3.0/settings.ini
sed --in-place "s/gtk-icon-theme-name = .*/gtk-icon-theme-name = \"$(jq -r .themes.icon ~/.config/hypr/themes/summer-night/config.json)\"/" ~/.config/gtk-3.0/settings.ini
sed --in-place "s/gtk-font-name = .*/gtk-font-name = \"$(jq -r .themes.font ~/.config/hypr/themes/summer-night/config.json) 13\"/" ~/.config/gtk-3.0/settings.ini
# ===================


# GTK 4.0
sed --in-place "s/gtk-cursor-theme-name = .*/gtk-cursor-theme-name = \"$(jq -r .themes.cursor ~/.config/hypr/themes/summer-night/config.json)\"/" ~/.config/gtk-4.0/settings.ini
sed --in-place "s/gtk-theme-name = .*/gtk-theme-name = \"$(jq -r .themes.gtk ~/.config/hypr/themes/summer-night/config.json)\"/" ~/.config/gtk-4.0/settings.ini
sed --in-place "s/gtk-icon-theme-name = .*/gtk-icon-theme-name = \"$(jq -r .themes.icon ~/.config/hypr/themes/summer-night/config.json)\"/" ~/.config/gtk-4.0/settings.ini
sed --in-place "s/gtk-font-name = .*/gtk-font-name = \"$(jq -r .themes.font ~/.config/hypr/themes/summer-night/config.json) 13\"/" ~/.config/gtk-4.0/settings.ini
# ===================
