{
	packageOverrides = pkgs: with pkgs; {
		myPackages = pkgs.buildEnv {
			name = "my-packages";
			paths = with pkgs; [
				git
				python3
				poetry
				zsh
			];
		};
	};
};
