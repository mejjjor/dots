#!/bin/sh

[[ "$1" == "-f" ]] && FORCE=true
SKIP=false

platformlink() {
  target=$1
  link=$2

  ln -sfFT $target $link
}

safelink()
{
  $SKIP && return

  target=$1
  link=$2

  if [ $FORCE ]; then
    DO_LINK=true
  else
    if [ -d $link -o -f $link ]; then
      DO_LINK=false

      echo -n "$(tput setaf 3)'$link' already exists, do you want to replace it? ([y]es/[N]o/[a]ll/[s]kip) $(tput sgr0)"

      read answer
      case $answer in
        "yes"|"y")
          DO_LINK=true
          ;;
        "all"|"a")
          FORCE=true
          DO_LINK=true
          ;;
        "skip"|"s")
          SKIP=true
          return
          ;;
        *)
          DO_LINK=false
          ;;
      esac
    else
      DO_LINK=true
    fi
  fi

  $DO_LINK && platformlink $target $link
}

safeinstall() {
  package=$1

  if type yaourt > /dev/null; then
    sudo yaourt -Sq --needed $package
  else
    sudo pacman -Sq --needed $package
  fi
}

BASEDIR=$(cd "$(dirname "$0")"; pwd)

# -- [[ Linking ]] -------------------------------------------------------------
echo "Linking configuration files..."
# .config directories
[[ -d ~/.config ]] || mkdir ~/.config
for file in `ls -d $BASEDIR/config/*`; do
  target=$BASEDIR/config/`basename $file`
  link=~/.config/`basename $file`
  safelink $target $link
done

mkdir -p ~/bin
safelink $BASEDIR/bin/icons ~/bin/icons
safelink $BASEDIR/bin/lock ~/bin/lock

# .gitconfig & .gitignore
safelink $BASEDIR/.gitconfig $HOME/.gitconfig
safelink $BASEDIR/.gitignore $HOME/.gitignore
safelink $BASEDIR/.xprofile $HOME/.xprofile

# -- [[ Package / plugins installation ]] --------------------------------------
echo
echo -n "Do you want to check packages? ([y]es/[N]o) "

read answer
case $answer in
  "yes"|"y")
    safeinstall yaourt
    safeinstall vim

    safeinstall i3

    safeinstall rofi
    # screenshot
    safeinstall scrot
    # image visualizer
    safeinstall feh
    safeinstall i3lock
    # notifications
    safeinstall dunst
    # multi clipboard
    safeinstall clipmenu
    # opacity on window
    safeinstall compton

    safeinstall zsh
    safeinstall termite
    safeinstall atom
    safeinstall sublime-text-dev 
    safeinstall htop
    safeinstall ranger
    safeinstall thunar

    safeinstall usbmount

    # audio output control
    safeinstall pavucontrol
    # wifi
    safeinstall nm-connection-editor
    # volume control
    safeinstall pamixer
    # bluetooth
    safeinstall blueman
    # brightness
    safeinstall xorg-xbacklight

    #dep open_from_here
    safeinstall xcwd-git

    #set screen resolution
    safeinstall xorg-xrandr

    echo "$(tput setaf 2)All dependencies are up to date$(tput sgr0)"
    ;;
  *)
    echo "$(tput setaf 3)Packages update skipped$(tput sgr0)"
    ;;
esac

echo "Last configurations ..."

safeinstall nerd-fonts-complete

safelink $BASEDIR/.zshrc $HOME/.zshrc
chsh -s /bin/zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
safelink $BASEDIR/.zprezto $HOME/.zprezto
safelink $BASEDIR/.zpreztorc $HOME/.zpreztorc
