nmap_ssh_open()
{
	if [ -n "$1" ]; then
		nmap -p 22 --open -sV "$1"
	fi
}

nmap_host_up()
{
	if [ -n "$1" ]; then
		nmap -sP "$1"
	fi
}
