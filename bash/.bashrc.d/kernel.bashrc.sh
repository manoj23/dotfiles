read_dtb()
{
	if [ -f "$1" ]; then
		dtc -I dtb -O dts "$1" | less
	else
		echo "File \"$1\" does no exist"
	fi
}
