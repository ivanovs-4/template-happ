{
  description = "{appname}";
  nixConfig.bash-prompt = ''[nix-develop]$ '';

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    haskell-flake-utils.url = "github:ivanovs-4/haskell-flake-utils";

  };

  outputs = { self, nixpkgs, ... }@inputs:
    with inputs.haskell-flake-utils.lib;
    simpleCabal2flake {
      inherit self nixpkgs;

      name = "{appname}";

    };
}
