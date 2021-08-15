#!/data/data/com.termux/files/usr/bin/bash

#Setup
set -e
shopt -s expand_aliases
alias ee='echo -e'

tag="v0.1"

#Greetings
echo
ee "\e[93mThis script will uninstall brainfuck in Termux."
echo

if [ ! -e $PREFIX/bin/brainfuck ] || [ ! -e $PREFIX/lib/libbrainfuck.a ];
then
  ee "\e[32mBrainfuck not installed..."
else
	ee "\e[32m[*] \e[34mRemoving files..."
	rm -rf $PREFIX/bin/brainfuck
	rm -rf $PREFIX/lib/libbrainfuck.a
	
	ee "\e[32m[*] \e[34mCleaning up temporary files..."
	rm -rf $HOME/uninstallbrainfuck.sh
fi