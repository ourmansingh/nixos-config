{ pkgs, ...}:

{
    home.packages = with pkgs; [
        vesktop
        libreoffice-fresh
        keepassxc
        nixd
        kitty
        gh
    ];


    programs.vscode = {
        enable = true;
        package = pkgs.vscode;
    };
    programs.firefox.enable = true;
}
