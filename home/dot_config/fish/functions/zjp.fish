function zjp
    set -l session_name (basename (pwd))

    if zellij list-sessions | grep -q "^$session_name"
        zellij attach $session_name
    else
        zellij --session $session_name
    end
end
