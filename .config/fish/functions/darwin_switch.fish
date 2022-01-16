function darwin_switch
    set -l nixpkgs $XDG_CONFIG_HOME/nixpkgs
    nix build $nixpkgs --out-link $nixpkgs/result
    $nixpkgs/result/sw/bin/darwin-rebuild switch --flake $nixpkgs
end
