
{
  input = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    niri.url = "github:sodiboo/niri-flake";
  };

  outputs = { self,nixpkgs,niri }: {
    nixosConfigurations.yourhostname = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
	niri.nixosModules.niri
	{
	  nixpkgs.overlays = [ niri.overlays.niri ];
        }
       ];
      };
   };
}

