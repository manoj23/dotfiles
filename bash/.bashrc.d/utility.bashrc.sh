sharkdp_fd()
{
	if test -x "$(command -v fd)"; then
		"$(command -v fd)"  "$@"
	elif test -x "$(__which fd)"; then
		"$(__which fd)"  "$@"
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

chksumfd () {
	find $1 -type f -print0 -not -name ".DS_Store" | LC_ALL=C sort -z | xargs -0 sha256sum | sha256sum
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

webcam_grab()
{
	VIDEO=/dev/video0

	if [ "$#" -eq 1 ]; then
		VIDEO=$1
	fi

	ffplay -f video4linux2 -framerate 50 -video_size 1920x1080 -input_format mjpeg "$VIDEO"
}

webcam_shot()
{
	VIDEO=/dev/video0
	FILE=$(mktemp -p . picture_XXX.jpeg)

	if [ "$#" -eq 1 ]; then
		VIDEO=$1
	fi

	ffmpeg -y -f video4linux2 -i "$VIDEO" -vframes 1  -video_size 640x480 "$FILE"

	echo "$FILE written"
}

t() {
	if [ -n "$ZSH_NAME" ]; then
		whence -f "$1"
	else
		SH="${0#"-"}"
		SH="$(basename "$SH")"
		if [ "$SH" = "bash" ]; then
			type "$1"
		fi
	fi
}

lsusb()
{
	# shellcheck disable=SC3010,SC3028
	if [[ "$OSTYPE" == "darwin"* ]]; then
		system_profiler SPUSBDataType
	else
		eval "$(__which lsusb)"
	fi
}

ccat()
{
	$(__which cat) "$@"
}

ssh() {
    if [ -z "$KITTY_WINDOW_ID" ]; then
        kitty +kitten ssh "$@"
    else
        command ssh "$@"
    fi
}
