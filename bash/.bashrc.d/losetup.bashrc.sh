losetup_attach()
{
	if [ $# -lt 1 ]; then
		echo "Not enough arguments, Bye!"
		return 1
	fi

	if [ ! -e "$1" ]; then
		echo "$1 does not exist, Bye!"
		return 1
	fi

	IMAGE=$1

	sudo losetup --partscan --show --find "${IMAGE}"
}

losetup_detach()
{
	if [ $# -lt 1 ]; then
		echo "Not enough arguments, Bye!"
		return 1
	fi

	DEVICE="/dev/loop$1"

	if [ ! -e "${DEVICE}" ]; then
		echo "$1 does not exist, Bye!"
		return 1
	fi

	sudo losetup --detach "${DEVICE}"
}
