mkimage_strip_header()
{
	if [ $# -lt 2 ]; then
		echo "Not enough argument, Bye!"
	fi

	if [ ! -f "$1" ]; then
		echo "$1 does not exist, Bye!"
	fi

	if [ -f "$2" ]; then
		echo "$2 already exists, Bye!"
	fi

	dd if="$1" of="$2" bs=1 skip=64
}

mkimage_initramfs()
{
	if [ $# -lt 3 ]; then
		echo "Not enough argument, Bye!"
	fi

	if [ ! -f "$1" ]; then
		echo "$1 does not exist, Bye!"
	fi

	if [ -f "$2" ]; then
		echo "$2 already exists, Bye!"
	fi

	if [ "${1: -8}" != ".cpio.gz" ]; then
		echo "$1 should have the .cpio.gz extension"
	fi

	if [ "${2: -14}" != ".cpio.gz.u-boot" ]; then
		echo "$2 should have the .cpio.gz.u-boot extension"
	fi

	local name=${3:-default}

	mkimage -A arm -O linux -T ramdisk -C none -n "$name" -d "$1" "$2"
}
