ROOT_DIR := $(shell dirname $(abspath $(lastword $(MAKEFILE_LIST))))

build: \
	create-directories \
	install-deps \
	plugins-clones \
	plugins-install

install: \
	clear-configuration \
	symbolic-links \
	copy-assets \
	reload

reload:
	xrdb ~/.Xresources
	i3-msg reload
	-pkill dunst
	-dunst -config ~/.config/dunst/dunstrc &

create-directories:
	mkdir -p ~/git
	mkdir -p ~/Programmes

install-deps:
	sudo apt install \
		i3 i3-wm dunst i3lock i3status suckless-tools xclip \
		compton hsetroot rxvt-unicode xsel rofi fonts-noto fonts-mplus \
		xsettingsd lxappearance scrot viewnior xbacklight \
		libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev libxss-dev libglib2.0-dev libpango1.0-dev libgtk-3-dev libxdg-basedir-dev libnotify-dev

clear-configuration:
	rm -f ~/.Xresources
	rm -f ~/.xsettingd
	rm -f ~/.gitconfig
	rm -f ~/.gitignore_global
	rm -rf ~/.config/i3
	rm -rf ~/.config/i3status
	rm -rf ~/.urxvt
	rm -rf ~/.cinnamon
	rm -rf ~/.config/dunst
	rm -rf ~/.config/rofi

symbolic-links:
	ln -s $(ROOT_DIR)/.Xresources ~
	ln -s $(ROOT_DIR)/.xsettingd ~
	ln -s $(ROOT_DIR)/.gitconfig ~
	ln -s $(ROOT_DIR)/.gitignore_global ~
	ln -s $(ROOT_DIR)/config/i3 ~/.config
	ln -s $(ROOT_DIR)/config/i3status ~/.config
	ln -s $(ROOT_DIR)/config/urxvt ~/.urxvt
	ln -s $(ROOT_DIR)/config/cinnamon ~/.cinnamon
	ln -s $(ROOT_DIR)/config/dunst ~/.config/dunst
	ln -s $(ROOT_DIR)/config/rofi ~/.config/rofi

copy-assets:
	cp -r fonts ~/.fonts
	cp wallpaper.jpg ~/.wallpaper.jpg

themes:
	lxappearance

plugins-clones:
	-mkdir plugins
	-git clone https://github.com/meskarune/i3lock-fancy.git $(ROOT_DIR)/plugins/i3lock-fancy
	-git clone https://github.com/dunst-project/dunst.git $(ROOT_DIR)/plugins/dunst

plugins-install:
	cd $(ROOT_DIR)/plugins/i3lock-fancy && sudo make install
	cd $(ROOT_DIR)/plugins/dunst && make && sudo make install
	cd $(ROOT_DIR)/plugins/dunst && make dunstify && cp -vs $(ROOT_DIR)/plugins/dunst/dunstify ~/.local/bin/
