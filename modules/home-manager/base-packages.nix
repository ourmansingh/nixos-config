{ pkgs, ...}:

{
    home.packages = with pkgs; [
        vesktop
        libreoffice-qt6-fresh
        keepassxc
        nixd
        kitty
    ];


    programs.vscode = {
        enable = true;
        package = pkgs.vscode;
    };
    programs.firefox.enable = true;
}
