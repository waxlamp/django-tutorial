{
  description = "Django tutorial project";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      devShell.x86_64-linux = pkgs.mkShell {
        buildInputs = with pkgs; [
          python38Full
          python38Packages.django
        ];
      };

      packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

      defaultPackage.x86_64-linux = self.packages.x86_64-linux.hello;
    };
}
