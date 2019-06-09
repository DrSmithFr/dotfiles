ROOT_DIR := $(shell dirname $(abspath $(lastword $(MAKEFILE_LIST))))

build: create-directories install-deps clone-repos install-repos

install: clear-configuration symbolic-links copy-assets reload

reload:
	xrdb ~/.Xresources
	i3-msg reload

create-directories:
	mkdir -p ~/git
	mkdir -p ~/Programmes

install-deps:
	sudo apt install \
	i3 \
	i3-wm dunst i3lock i3status suckless-tools xclip \
	compton hsetroot rxvt-unicode xsel rofi fonts-noto fonts-mplus xsettingsd lxappearance scrot viewnior \
	cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev

clone-repos:
	-git clone https://github.com/jaagr/polybar.git ~/Programmes/polybar

install-repos:
	cd ~/Programmes/polybar && ./build.sh && cd $(ROOT_DIR)

clear-configuration:
	rm -f ~/.Xresources
	rm -f ~/.xsettingd
	rm -rf ~/.config/i3
	rm -rf ~/.config/i3status
	rm -rf ~/.urxvt

symbolic-links:
	ln -s $(ROOT_DIR)/.Xresources ~
	ln -s $(ROOT_DIR)/.xsettingd ~
	ln -s $(ROOT_DIR)/i3 ~/.config
	ln -s $(ROOT_DIR)/i3status ~/.config
	ln -s $(ROOT_DIR)/urxvt ~/.urxvt

copy-assets:
	cp -r fonts ~/.fonts
	cp wallpaper.jpg ~/.wallpaper.jpg