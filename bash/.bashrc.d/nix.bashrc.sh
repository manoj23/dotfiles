nix_update()
{
	udo nixos-rebuild switch
}

nix_clean_up()
{
	nix-collect-garbage
	sudo nix-collect-garbage
}
