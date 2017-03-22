#! /bin/sh

#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.


# Displays the directory stack (dirs -p) in a nice way. Intended for use with oh-my-zsh.

# color1 and color2 are the colors with which the string is printed. The color alternates with each dirstack entry. reset_color is the color that is appended to the end of the string (this is useful when this script is used as a command prompt, for example). 
color1=$1
color2=$2
reset_color=$3

# Basically, the sed expression takes care of shortening the path name, cut is for displaying only directory paths shorter than 21 characters and the awk expression is for the colors. Finally, using head -4, only the first four elements of the dirstack get displayed and with tr I can delete the newlines that are still in the string.
dirs -p | tail -n +2 | sed -r 's_([^ ])[^/]*/_\1/_g' | cut -b 1-20 | awk "BEGIN {i = 1}; {if (i % 2 == 0) {print \"%{$color1%}\" (i-1) \" \" \$0 \" \"; i++;} else {print \"%{$color2%}\" (i-1) \" \" \$0 \" \"; i++}}; END {print \"%{$reset_color%}\"};" | head -4 | tr -d '\n' 


