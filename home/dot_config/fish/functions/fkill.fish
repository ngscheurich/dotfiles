function fkill -d "Fuzzy-find and kill a process"
  echo -{$argv[1] : 9}
  set -f $(ps -ef | sed 1d | fzf -m | awk '{print $2}') 
  if test -n "$pid"
    echo $pid | xargs kill -{(count $argv) > 0 ? $argv[1] : 9}
  end
end
