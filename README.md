# my-config
Nord Themed Config File for GTK, Alacritty, Fish, Vim, Spotify, and Chromium startpage

## Gnome/GTK/Kvantum Theme
Nordic: https://github.com/EliverLara/Nordic

## Icons Theme
Papirus: https://github.com/PapirusDevelopmentTeam/papirus-icon-theme

## Installation
- ***First of all, clone this repository***
```bash
git clone https://github.com/jhagas/my-config
cd my-config
```

- ***Welcome Message Install***
```bash
sudo cp hai2 /usr/bin/hai2
```

- ***Fish Config Install (you can edit everything later)***
```bash
cp -r fish ~/.config/
```

- ***.vimrc Install***
```bash
cp .vimrc ../
```

- ***Alacritty Config File Install***
```bash
mkdir ~/.config/alacritty
cp alacritty.yml ~/.config/alacritty/
```

- ***Chromium Startpage Install***
1. Open Extensions menu on Chromium
2. Turn on developer mode
3. Click "Load Unpacked"
4. Find the startpage directory
usually located in
```~/my-config/startpage/```

- ***Spotify Theme Install***
Make sure you already install Spicetify and have opened it before
```bash
cp -r Dribbliish ~/.config/spicetify/Themes/
```
Configuring:
```bash
cd "$(dirname "$(spicetify -c)")/Themes/Dribbblish"
mkdir -p ../../Extensions
cp dribbblish.js ../../Extensions/
spicetify config extensions dribbblish.js
spicetify config current_theme Dribbblish color_scheme nord-dark
spicetify config inject_css 1 replace_colors 1 overwrite_assets 1
spicetify apply
```

# Enjoy!!
