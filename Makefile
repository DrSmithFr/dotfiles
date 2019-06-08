ROOT_DIR := $(shell dirname $(abspath $(lastword $(MAKEFILE_LIST))))

build: install-deps

install: clear-configuration symbolic-links copy-assets

install-deps:
	sudo apt install \
	i3 \
	i3-wm dunst i3lock i3status suckless-tools \
	compton hsetroot rxvt-unicode xsel rofi fonts-noto fonts-mplus xsettingsd lxappearance scrot viewnior

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