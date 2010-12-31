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

TEMPLATE = subdirs

CONFIG += ordered
SUBDIRS = src/lib src/pdf src/image

readme1.target=README_WKHTMLTOPDF
readme1.commands=make -C src/pdf/ ../../README_WKHTMLTOPDF
readme1.depends=sub-src-lib-qmake_all

readme2.target=README_WKHTMLTOIMAGE
readme2.commands=make -C src/image/ ../../README_WKHTMLTOIMAGE
readme2.depends=sub-src-lib-qmake_all

QMAKE_EXTRA_TARGETS += readme1 readme2
