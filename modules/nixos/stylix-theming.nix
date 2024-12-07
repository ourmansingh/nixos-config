{ pkgs, config, ... }:
{
  stylix = { 
    enable = true;
    image = ../../wallpaper.png;
    base16Scheme = "$(pkgs.base16-schemes)/share/themes/macintosh.yaml";

    fonts = {
      serif = {
        package = config.stylix.fonts.sansSerif;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };

}