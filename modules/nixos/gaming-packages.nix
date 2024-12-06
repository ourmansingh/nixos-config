{ pkgs, ...}:
{
    environment.systemPackages = with pkgs; [
        heroic
    ];

    programs.steam = {
        enable = true;
        gamescopeSession.enable = true;
    };

    programs.gamemode = {
        enable = true;
    };
}
