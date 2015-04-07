#!/bin/bash
# Bash script for downloading a site with assets. 
#
#
# Copyright 2014 Kapunahele Wong kapunahelewong@gmail.com


bold=`tput bold`
normal=`tput sgr0`
clear
echo
echo
echo -e "\033[30;42m************************************************"
echo -e "                                                "
echo -e "                  ${bold} Make It Mine${normal}\033[30;42m                 "
echo -e "                                                "
echo -e "      Download a website with its assets.       "
echo -e "                                                "
echo -e "        Copyright 2014 Kapunahele Wong          "
echo -e "                                                "
echo -e "                                                "
echo -e "************************************************\033[0m"
echo

echo "Enter a name for your download folder"
echo "and press Return. It will be created"
echo "on your desktop. No spaces please: "
read project_directory
echo
echo
echo "Enter the ENTIRE URL(including http or" 
echo "https) of the site you want to download"
echo "and press Return: "
read website
echo 
echo
mkdir $HOME/Desktop/$project_directory
cd $HOME/Desktop/$project_directory


echo "Checking for Homebrew and wget (needed for site download)..."

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install wget
fi

# Update homebrew recipes
# brew update

# brew install wget

wget -E -H -k -p $website
echo
echo

echo
echo "Opening Finder window ${project_directory}."
# if grep -q *://*.* <<<$website then
if grep -q http: <<<$website; then
	folder_name=${website:7}
	echo $folder_name
        echo -e "\033[30;42mSUCCESS!\033[0m"
	echo "Opening Chrome with local copy of website."
	open .
	cd $folder_name
        open -a Google\ Chrome --args $HOME/Desktop/$project_directory/$folder_name/index.html
elif grep -q https: <<<$website; then
        folder_name=${website:8}
        echo $folder_name
        echo -e "\033[30;42mSUCCESS!\033[0m"
        echo "Opening Chrome with local copy of website."
        open .
        cd $folder_name
        open -a Google\ Chrome --args $HOME/Desktop/$project_directory/$folder_name/index.html
else
        echo "Opening download directory in Finder. Opening Chrome."
        open .
	open -a Google\ Chrome --args 
fi
# else
#      echo $HOME/Desktop/$project_directory   
#      echo "YOU MADE IT!"
fi
