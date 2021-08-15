#!/data/data/com.termux/files/usr/bin/bash

#Setup
set -e
shopt -s expand_aliases
alias ee='echo -e'

tag="v0.1"

#Greetings
echo
ee "\e[93mThis script will install brainfuck in Termux."
ee "\e[93mLibraries compiled by \e[32mJMRaichDev\e[93m, script written by \e[32mJMRaichDev\e[93m, interpreter writtent by \e[32mfabianishere\e[93m and can be found at  \e[32mhttps://github.com/fabianishere/brainfuck\e[93m."
echo

if [ -e $PREFIX/bin/brainfuck ] || [ -e $PREFIX/lib/libbrainfuck.a ];
then
  ee "\e[32mBrainfuck is already installed..."
else
  ee "\e[34mDownloading brainfuck..."
  
  case `dpkg --print-architecture` in
	aarch64)
		archname="aarch64";;
	arm64)
		archname="aarch64";;
	armhf)
		archname="arm";;
	armv7l)
		archname="arm";;
	arm)
		archname="arm";;
	*)
		ee "\e[91mERROR: Unknown architecture."; echo; exit ;;
	esac
	
	wget https://github.com/JMRaichDev/Termux-brainfuck/releases/download/$tag/brainfuck_${archname}.tar.gz -q

	ee "\e[32m[*] \e[34mMoving brainfuck to system..."
	mv brainfuck_${archname}.tar.gz $PREFIX/share

	ee "\e[32m[*] \e[34mExtracting brainfuck..."
	cd $PREFIX/share
	tar -xhf brainfuck_${archname}.tar.gz

	ee "\e[32m[*] \e[34mCoping files..."
	cp bin/brainfuck $PREFIX/bin/
	cp lib/libbrainfuck.a $PREFIX/lib/
	
	ee "\e[32m[*] \e[34mSetting up permissions..."
	chmod gou+rwx $PREFIX/bin/brainfuck

	ee "\e[32m[*] \e[34mCleaning up temporary files..."
	rm -rf $HOME/installbrainfuck.sh
	rm -rf $PREFIX/share/brainfuck_${archname}.tar.gz
	rm -rf $PREFIX/share/bin
	rm -rf $PREFIX/share/lib
fi