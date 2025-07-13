# https://github.com/junegunn/fzf/wiki/Examples-(fish)#git
function fco -d "Fuzzy-find and checkout a Git branch"
  git branch --all \
    | grep -v HEAD \
    | string trim \
    | fzf \
    | read -l result; \
    and git checkout "$result"
end
