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
