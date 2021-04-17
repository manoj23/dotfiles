lxc_start()
{
	if [ -n "$1" ]; then
		sudo lxc-start -n "$1"
	fi
}

lxc_stop()
{
	if [ -n "$1" ]; then
		sudo lxc-stop -n "$1"
	fi
}

lxc_restart()
{
	if [ -n "$1" ]; then
		lxc_stop "$1"
		lxc_start "$1"
	fi
}


lxc_ls()
{
	sudo lxc-ls
}

lxc_get_ip()
{
	if [ -n "$1" ]; then
		sudo lxc-ls -f "$1" -F IPV4 | grep -v IPV4
	fi
}
