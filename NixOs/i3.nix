{ config, pkgs, lib, ... }:
let
	mod = "Mod4";
in {
  environment = {
    pathsToLink = ["/libexec"];
    systemPackages = with pkgs; [
      lightdm 
      terminator
      qutebrowser 
	  firefox
      thunderbird
      keepassx2
      arandr
      pavucontrol
      chromium
    ];
  };

  services.xserver = {
    enable = true;
    layout = "gb";
    displayManager.lightdm.enable = true;
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3;
      extraPackages = with pkgs; [
      dmenu
      i3status
      i3lock
      ];
    };
  };

  home-manager.users.lucy = {
    xsession.windowManager.i3 = {
      enable = true;
      config = {
    	modifier = mod;
        assigns = {
          "1" = [{class = "Terminator";}];
          "2" = [{class = "qutebrowser";}];
          "3" = [{class = "Firefox"; instance = "Navigator";}];
          "4" = [
            {class = "Thunderbird";}
            {class = "Keepassx";}];
    
          "5" = [{class = "discord";}];
          "6" = [{class = "Chromium-browser";}];
        };

        startup = [
            {command = "terminator";}
            {command = "qutebrowser";}
            {command = "keepassx";}
            {command = "thunderbird";}
            {command = "discord";}
            {command = "chromium-browser";}
            {command = "firefox";}
        ];
    
  		keybindings = lib.mkOptionDefault {
  		  "${mod}+p" = "exec ${pkgs.dmenu}/bin/dmenu_run";
  		  #"${mod}+x" = "exec sh -c '${pkgs.maim}/bin/maim -s | xclip -selection clipboard -t image/png'";
  		  #"${mod}+Shift+x" = "exec sh -c '${pkgs.i3lock}/bin/i3lock -c 222222 & sleep 5 && xset dpms force of'";
  
  		  # Focus
  		  "${mod}+h" = "focus left";
  		  "${mod}+j" = "focus down";
  		  "${mod}+k" = "focus up";
  		  "${mod}+l"= "focus right";
  
  		  # Move
  		  "${mod}+Shift+h" = "move left";
  		  "${mod}+Shift+j" = "move down";
  		  "${mod}+Shift+k" = "move up";
  		  "${mod}+Shift+l" = "move right";
  		};
  
  	    bars = [{position = "bottom"; statusCommand = "i3status";}];
  	  };
    };
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;
}

