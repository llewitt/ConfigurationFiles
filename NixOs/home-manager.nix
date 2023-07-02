{ config, pkgs, lib, ... }:
let
	home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
    imports = [ (import "${home-manager}/nixos") ];

	home-manager.users.lucy = {
        home.packages = with pkgs; [
            oh-my-zsh 
        ]; 

		programs.vim = {
			enable = true;
			extraConfig = ''
			inoremap jk <ESC>
			set tabstop=4
			set shiftwidth=4
			set number
            set foldmethod=indent
            set nowrap
			'';
		};
        
        programs.zsh = {
            enable = true;
            oh-my-zsh = {
                enable = true;
                plugins = ["git"];
                theme = "robbyrussell";
            };

            initExtra = ''
                if [ -z $TMUX ]; then
                    tmux attach || tmux new
                fi
            '';
        };

        programs.tmux = {
            enable = true;
            prefix = "C-b";
            keyMode = "vi";
        };
	};
}

