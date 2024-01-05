alias firefox="firefox& > /home/cdaron/.nix-profile/bin/firefox/runlogs.log"

alias rb="sudo nixos-rebuild switch --flake /etc/nixos/#nixos"
alias rba="sudo nixos-rebuild switch --flake /etc/nixos/#nixos; home-manager switch"
alias ecfg="sudo vi /etc/nixos/configuration.nix"
alias eflk="sudo vi /etc/nixos/flake.nix"
alias hm="home-manager"
alias ehm="vi ~/.config/home-manager/home.nix"
alias ei3="vi ~/.config/i3/config"
export EDITOR=vim
