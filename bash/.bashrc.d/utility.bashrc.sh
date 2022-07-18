sharkdp_fd()
{
	if test -x "$(command -v fd)"; then
		"$(command -v fd)"  "$@"
	elif test -x "$(which fd)"; then
		"$(which fd)"  "$@"
	elif test -x "$(command -v fdfind)"; then
		"$(command -v fdfind)" "$@"
	fi
}

kermit()
{
	if [ $# == 1 ]; then
		ckermit -c -y .kermrc -l "/dev/tty$1"
	fi
}

tmux()
{
	TERM=screen-256color $(which tmux)
}

copy_sd()
{
	if [ $# != 2 ] || [ ! -b "/dev/$1" ] || [ ! -f "$2" ]; then
		echo "copy_sd sd{X} /path/to/file"

		if [ $# == 2 ]; then
			if [ ! -b "/dev/$1" ]; then
				echo "copy_sd: Error: /dev/$1 is not a block device"
			fi
			if [ ! -f "$2" ]; then
				echo "copy_sd: Error: $2 is not a file"
			fi
		fi
	else
		pmount "/dev/$1"
		sudo cp "$2" "/media/$1/"
		sleep 0.1
		pumount "$1"
		sync
		sync
	fi
}

make_ramdisk()
{
	find "$1" | cpio -o -H newc | gzip > "$2.cpio.gz"
}

hexstring_to_binary()
{
	if [ ! -z "$1" ]; then
		# http://stackoverflow.com/a/7681385
		echo -n "$1" | sed 's/\([0-9A-F]\{2\}\)/\\\\\\x\1/gI' | xargs printf
	fi
}

date_for_setting()
{
	date -u  "+%Y-%m-%d %H:%M:%S"
}

# search strings in binaries
# Example:
#  Look for string "abc" in binaries that ends in .a
#    ug .a "abc"
ug()
{
	sharkdp_fd "$1"$ -tf -x bash -c "if rg -q \"$2\" <(strings {}) ; then echo {}; fi"
}

reboot() {
	echo "Are you sure you want to reboot?"
	read -r reply
	if [ "$reply" = "yes" ]; then
		sudo "$(command -v reboot)"
	fi
}
