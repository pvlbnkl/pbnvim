{
  description = "personal neovim flake";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
    };
  };
    neovim = {
      url = "github:neovim/neovim/stable?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  outputs = { self, nixpkgs, neovim }: { 
    packages.aarch64-darwin.default = neovim.packages.aarch64-darwin.neovim;
    apps.aarch64-darwin.default = {
      type = "app";
      program = "${neovim.packages.aarch64-darwin.neovim}/bin/nvim";
    };
    };
}
