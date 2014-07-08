for file in ~/dotfiles/{basic,paths,bash_prompt,aliases,completions,functions}; do
  source $file;
done;
unset file;

# use .localrc for settings specific to one system
if [ -r ~/.localrc ]; then
  source ~/.localrc
fi

if [ -r ~/.bashrc.local ]; then
  source ~/.bashrc.local
fi

#rvm include
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
#screenenator include
if [[ -s $HOME/.screeninator/scripts/screeninator ]] ; then source $HOME/.screeninator/scripts/screeninator ; fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
