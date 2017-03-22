# ShowDirStack

ShowsDirStack is a very small script that displays the directory stack (`dirs -p`) in a nice way. It is intended to be used with oh-my-zsh.

To install, first clone the repository. Then, browse to your oh-my-zsh themes folder and open the file containing the theme you use. There should be an environment variable defined in your `.zshrc` or somewhere similar that's called `ZSH_THEME` if you don't know what theme you're using. It's probably easiest to just use this command:

`vim "$ZSH/themes/$ZSH_THEME.zsh-theme"`

Having opened up the theme, search for the place where the `RPROMPT` variable is defined. This is the variable that zsh uses to determine the contents of your zsh prompt. (zsh has two prompts, a left and a right one. If you would like to modifiy the left prompt instead, simply search for PROMPT)

Define RPROMPT accordingly. For example, depending on how you would like your prompt to look like, you could do something like:

`RPROMPT="$(~/scripts/gittracked/showDirStack/showDirStack.sh $fg_bold[green] $fg_bold[yellow] $reset_color)"`

The first argument is the first color, the second argument the alternate color. The third argument specifies the color that the text *after* the prompt should be set to.

Of course, make sure to replace the above path to showDirStack.sh with the actual path where you cloned your repository.
