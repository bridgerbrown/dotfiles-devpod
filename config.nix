{
	packageOverrides = pkgs: with pkgs; {
		myPackages = pkgs.buildEnv {
			name = "my-packages";
			paths = [
				git
				homebrew
				neovim
				python3
				poetry
			]
		}
	}
}

