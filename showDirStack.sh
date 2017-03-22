#! /bin/sh

# Displays the directory stack (dirs -p) in a nice way. Intended for use with oh-my-zsh.

# color1 and color2 are the colors with which the string is printed. The color alternates with each dirstack entry. end_color is the color that is appended to the end of the string (this is useful when this script is used as a command prompt, for example). 
color1=$1
color2=$2
end_color=$3

# Basically, the sed expression takes care of shortening the path name, cut is for displaying only directory paths shorter than 21 characters and the awk expression is for the colors. Finally, using head -4, only the first four elements of the dirstack get displayed and with tr I can delete the newlines that are still in the string.
dirs -p | tail -n +2 | sed -r 's_([^ ])[^/]*/_\1/_g' | cut -b 1-20 | awk "BEGIN {i = 1}; {if (i % 2 == 0) {print \"%{$color1%}\" (i-1) \" \" \$0 \" \"; i++;} else {print \"%{$color2%}\" (i-1) \" \" \$0 \" \"; i++}}; END {print \"%{$end_color%}\"};" | head -4 | tr -d '\n' 


