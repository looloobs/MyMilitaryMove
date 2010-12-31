#!/bin/bash
#
# Copyright 2010 wkhtmltopdf authors
#
# This file is part of wkhtmltopdf.
#
# wkhtmltopdf is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# wkhtmltopdf is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with wkhtmltopdf.  If not, see <http:#www.gnu.org/licenses/>.

cd "release-$1"
wget http://support.googlecode.com/svn/trunk/scripts/googlecode_upload.py -O googlecode_upload.py

function ul() {
	source ../upload.conf
	python googlecode_upload.py -u "$USER" -w "$PASS" -s "$1" -p "wkhtmltopdf" -l "$2" "$3"
}

if ! [ -f "wkhtmltopdf-$1.tar.lzma" ] ||
   ! [ -f "wkhtmltopdf-$1-static-i386.tar.lzma" ] ||
   ! [ -f "wkhtmltopdf-$1-static-amd64.tar.lzma" ] ||
   ! [ -f "wkhtmltox-$1-installer.exe" ] ||
   ! [ -f "wkhtmltoimage-$1-static-i386.tar.lzma" ] ||
   ! [ -f "wkhtmltoimage-$1-static-amd64.tar.lzma" ] ||
   ! [ -f "libwkhtmltox-$1.zip" ] ||
   ! [ -f "libwkhtmltox-$1-i386.tar.lzma" ] ||
   ! [ -f "libwkhtmltox-$1-amd64.tar.lzma" ] ; then
	echo "File Missing"
	exit 1
fi

ul "wkhtmltopdf-$1 Source" "Type-Source,OpSys-All,Featured" "wkhtmltopdf-$1.tar.lzma"
ul "wkhtmltopdf-$1 Linux Static Binary (i368)" "Type-Executable,OpSys-Linux,Featured" "wkhtmltopdf-$1-static-i386.tar.lzma"
ul "wkhtmltopdf-$1 Linux Static Binary (amd64)" "Type-Executable,OpSys-Linux,Featured" "wkhtmltopdf-$1-static-amd64.tar.lzma"
ul "wkhtmltox-$1 Windows Installer (i368)" "Type-Installer,OpSys-Windows,Featured" "wkhtmltox-$1-installer.exe"
ul "wkhtmltoimage-$1 Linux Static Binary (i368)" "Type-Executable,OpSys-Linux,Featured" "wkhtmltoimage-$1-static-i386.tar.lzma"
ul "wkhtmltoimage-$1 Linux Static Binary (amd64)" "Type-Executable,OpSys-Linux,Featured" "wkhtmltoimage-$1-static-amd64.tar.lzma"
ul "libwkhtmltox-$1 Linux Static Library (i368)" "Type-Archive,OpSys-Linux" "libwkhtmltox-$1-i386.tar.lzma"
ul "libwxhtmltox-$1 Linux Static Library (amd64)" "Type-Archive,OpSys-Linux" "libwkhtmltox-$1-amd64.tar.lzma"
ul "libwkhtmltox-$1 Windows Static Library (i368)" "Type-Archive,OpSys-Windows" "libwkhtmltox-$1.zip"
