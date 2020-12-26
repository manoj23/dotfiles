dvd_format()
{
	dvd+rw-format -blank=fast /dev/sr0
}

dvd_burn_iso()
{
	if [ $# -lt 1 ]; then
		echo "Not enough arguments, Bye!"
		return 1
	fi

	if [ ! -e "$1" ]; then
		echo "$1 does not exist, Bye!"
		return 1
	fi

	ISO_IMAGE=$1

	growisofs -dvd-compat -Z "/dev/sr0=$ISO_IMAGE"
}
