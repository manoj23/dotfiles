android_flash_kernel()
{
	if [ -b "/dev/$1" ] && [ -f "$2" ]; then
		sudo abootimg -u "/dev/$1" -k "$2";
	fi
}

android_flash_dtb()
{
	if [ -b "/dev/$1" ] && [ -f "$2" ]; then
		sudo abootimg -u "/dev/$1" -s "arch/arm/boot/dts/$2";
	fi
}

android_mk_raw()
{
	if [ $# -lt 1 ]; then
		echo "Not enough arguments, Bye!"
		return 1
	fi

	if [ ! -e "$1" ]; then
		echo "$1 does not exist, Bye!"
		return 1
	fi

	local img_file="$1"
	local img_file_extension=${img_file##*.}

	if [ "$img_file_extension" != "img" ]; then
		echo "$img_file does not end with .img, Bye!"
		return 1
	fi

	local raw_file="$(basename "$img_file").raw"

	simg2img "$img_file" "$raw_file"
}
