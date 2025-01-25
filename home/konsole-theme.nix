{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
    name = "konsole-theme";
    src = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "konsole";
        rev = "3b64040e3f4ae5afb2347e7be8a38bc3cd8c73a8";
        sha256 = "d5+ygDrNl2qBxZ5Cn4U7d836+ZHz77m6/yxTIANd9BU=";
    };
    installPhase = ''
        mkdir -p $out
        cp -R ./* $out/
    '';
}
