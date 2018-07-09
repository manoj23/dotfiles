lxc_ls()
{
	sudo lxc-ls
}

lxc_get_ip()
{
	if [ ! -z "$1" ]; then
		sudo lxc-ls -f "$1" -F IPV4
	fi
}
