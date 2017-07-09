Preference Configuration of Emacs Lisps

Main Packages Support:
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
<1> Elisp dependencies
These dependencies will be installed automatically when using the standard installation procedure described below.

cl-lib	Built-in since Emacs 24.3
json	Built-in since Emacs 23.1
YASnippet	Optional. May be used to provide post-completion expansion of function arguments

<2> Irony-Server Prerequisites
irony-server provides the libclang interface to irony-mode. It uses a simple protocol based on S-expression. This server, written in C++ and requires the following packages to be installed on your system:

CMake >= 2.8.3
libclang

Installation:
<update> sudo apt-get update --fix-missing
<upgrade> sudo apt-get upgrade
<CMAKE> sudo apt-get install cmake
<libclang> sudo apt-get install libclang-3.5-dev
<irony-server>
sudo cmake -DCMAKE_INSTALL_PREFIX\=/home/xiaoluncao/.emacs.d/irony/ /home/xiaoluncao/.emacs.d/elpa/irony-mode/server
sudo cmake --build . --use-stderr --config Release --target install

Enjoy!
