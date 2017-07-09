# A Personal Preference Configuration of Emacs
  This is my emacs configuration tree, which maintained since in 
Sato Takashi Lab in Kyoto University, and now ammend several new packages 
for fansy and convient features. Light-weight and transportability are 
considered as the most important things. 

Main Packages Support:
-
*  quickrun
*  auto-complete
*  irony
*  company
*  company-irony
*  irony-server
*  flycheck
*  flycheck-irony
*  sublime-themes
*  helm
*  melpa
*  gnupg
*  minimap
*  markdown-mode
*  ctags
*  color-theme-sanityinc-tomorrow

Dependencies:
-
1) Elisp dependencies
These dependencies will be installed automatically when using the
standard procedure.

* cl-lib	Built-in since Emacs 24.3
* json	Built-in since Emacs 23.1

2) Irony-Server Prerequisites (Please refer https://github.com/Sarcasm/irony-mode)
irony-server provides the libclang interface to irony-mode with a simple protocol based on S-expression. This server, written in C++ and requires the following packages to be installed on your system:

* CMake >= 2.8.3
* libclang

Installation:
-
```shell
# git clone the repo
cd ~
git clone https://github.com/oscarriddle/emacs.d.git ~/.emacs.d
# install dependencies from root authority
sudo apt-get update --fix-missing
sudo apt-get upgrade
sudo apt-get install cmake # in case you didn't have cmake
sudo apt-get install libclang-3.5-dev
# cmake irony and install
sudo cmake -DCMAKE_INSTALL_PREFIX\=/home/xiaoluncao/.emacs.d/irony/ /home/xiaoluncao/.emacs.d/elpa/irony-mode/server
sudo cmake --build . --use-stderr --config Release --target install
```

Enjoy
