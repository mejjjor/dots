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

# -- [[ Package / plugins installation ]] --------------------------------------
echo
echo -n "Do you want to check packages? ([y]es/[N]o) "

read answer
case $answer in
  "yes"|"y")
    # node js manager
    safeinstall nvm
    # ruby manager
    safeinstall rbenv

    echo "$(tput setaf 2)All dependencies are up to date$(tput sgr0)"
    ;;
  *)
    echo "$(tput setaf 3)Packages update skipped$(tput sgr0)"
    ;;
esac
