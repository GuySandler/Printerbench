{ pkgs }: {
	deps = with pkgs; [
		pkgs.nodePackages.prettier
		nodejs-18_x
		nodePackages.typescript-language-server
		nodePackages.svelte-language-server
	];
}