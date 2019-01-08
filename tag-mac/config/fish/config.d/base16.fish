# load currently active theme...
if test -e ~/.base16_theme
  sh (realpath ~/.base16_theme)
end


# set aliases, like base16_*...
for SCRIPT in ~/.config/base16-shell/scripts/*.sh
  set THEME (basename $SCRIPT .sh)
  function $THEME -V SCRIPT -V THEME
    sh $SCRIPT
    ln -sf $SCRIPT ~/.base16_theme
    set -x BASE16_THEME (string split -m 1 '-' $THEME)[2]
    echo -e "if !exists('g:colors_name') || g:colors_name != '$THEME'\n  colorscheme $THEME\nendif" >  ~/.vimrc_background
  end
end
