source ~/.env
source ~/.asdf/asdf.fish
eval (direnv hook fish)

# nice light cyan color instead of dark blue
set -gx LSCOLORS gxfxcxdxbxegedabagacad

function ls --description 'List contents of directory'
  command ls -lhFG --color $argv
end

function df --description 'Displays disk free space'
  command df -H $argv
end

function grep --description 'Colorful grep that ignores binary file and outputs line number'
  command grep --color=always -I $argv
end

function gg --description 'git grep with color'
  command git grep -n --color $argv
end

function git-replace --description "replace all in repo"
  set replace $argv[1];
  set to_replace $argv[2];
  switch (uname)
    case Linux
      command git grep -l $replace | xargs sed -i '' "s/$replace/$to_replace/g"
    case Darwin
      command git grep -l $replace | xargs sed -i '' -e "s/$replace/$to_replace/g"
  end
end

function gf --description 'Do a git fetch'
  command git fetch
end

function gdeletemergedcurrent --description 'Delete all local branches that is already merged to current branch (exludes master)'
  command git branch --merged | grep -v "\*" | grep -v "master" | xargs -n 1 git branch -d
  command git remote prune origin
end

function gcp --description 'do a cherry-pick'
  command git cherry-pick $argv
end

function clion --description 'Launch Clion'
  command bash ~/applications/clion/bin/clion.sh &
end

function phpstorm --description 'Launch PHPStorm'
  command bash ~/applications/phpstorm/bin/phpstorm.sh &
end

function goland --description 'Launch Goland'
  command bash ~/applications/goland/bin/goland.sh &
end
