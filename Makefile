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
		libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev libxss-dev libglib2.0-dev libpango1.0-dev libgtk-3-dev libxdg-basedir-dev libnotify-dev \
		build-essential git cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev \
		libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev \
		clang xfonts-terminus x11-utils fonts-font-awesome

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
	rm -rf ~/.config/polybar

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
	ln -s $(ROOT_DIR)/config/polybar ~/.config/polybar

copy-assets:
	cp -r fonts ~/.fonts
	cp wallpaper.jpg ~/.wallpaper.jpg

themes:
	lxappearance

plugins-clones:
	-mkdir plugins
	-git clone https://github.com/meskarune/i3lock-fancy.git $(ROOT_DIR)/plugins/i3lock-fancy
	-git clone https://github.com/dunst-project/dunst.git $(ROOT_DIR)/plugins/dunst
	-git clone https://github.com/polybar/polybar.git $(ROOT_DIR)/plugins/polybar
	-git clone https://github.com/stark/siji $(ROOT_DIR)/plugins/siji

plugins-install:
	cd $(ROOT_DIR)/plugins/i3lock-fancy; sudo make install
	cd $(ROOT_DIR)/plugins/dunst; make; sudo make install
	cd $(ROOT_DIR)/plugins/dunst; make dunstify
	-cp -vs $(ROOT_DIR)/plugins/dunst/dunstify ~/.local/bin/
	-mkdir $(ROOT_DIR)/plugins/polybar/build; cd $(ROOT_DIR)/plugins/polybar; ./build.sh
	-cd $(ROOT_DIR)/plugins/siji; ./install.sh
