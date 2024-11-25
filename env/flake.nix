{
    description = "Enable the 'reveal_hugo_tutorial' Nix environment.";

    inputs =
    {
        # All latest packages.
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        # Hugo version 0.123.7.
        hugo.url = "github:nixos/nixpkgs/a343533bccc62400e8a9560423486a3b6c11a23b";

        # python 3.12.
        python.url = "github:nixos/nixpkgs/a71323f68d4377d12c04a5410e214495ec598d4c";
        # Plotly 5.24.1.
        plotly.url = "github:nixos/nixpkgs/a61cd8ff1b45f760bdf142914d517e0ccd31ffed";
        # Numpy 2.1.2.
        numpy.url = "github:nixos/nixpkgs/4ae2e647537bcdbb82265469442713d066675275";
    };

    outputs = { self, nixpkgs, ... }@inputs:
        let
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
        in
        {
            devShells.${system}.default = pkgs.mkShell
            {
                name = "reveal_hugo_tutorial";

                packages = with pkgs; [
                    inputs.hugo.legacyPackages.${system}.hugo
                    inputs.python.legacyPackages.${system}.python312
                    inputs.plotly.legacyPackages.${system}.python312Packages.plotly
                    inputs.numpy.legacyPackages.${system}.python312Packages.numpy_2
                    xdg-utils
                ];

                shellHook = ''
                    command="xdg-open http://localhost:1313;"
                    command+="hugo server --renderStaticToDisk -p 1313;"

                    alias serve=$command
                '';
            };
        };
}
