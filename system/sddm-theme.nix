{ pkgs }:

pkgs.stdenv.mkDerivation {
    name = "sddm-theme";
    src = pkgs.fetchFromGitHub {
        owner = "Keyitdev";
        repo = "sddm-astronaut-theme";
        rev = "8f41a8365ac7b566086a664f2fbfb07ff7c87465";
        sha256 = "JoSOrTJJYThwCKSPBwj9exhejg/ASY6s9iDcJ+zn8ME=";
    };
    installPhase = ''
        mkdir -p $out
        cp -R ./* $out/
    '';
}
