create_cpio_archive()
{
	if [ $# -lt 1 ]; then
		echo "Not enough arguments, Bye!"
		exit 1
	fi

	if [ ! -d "$1" ]; then
		echo "$1 is not folder, Bye!"
		exit 1
	fi

	if [ -e "$1.cpio" ]; then
		echo "$1 already exists, Bye!"
		exit 1
	fi

	(cd "$1" && find . | cpio -o -H newc > ../"$1".cpio)
}

create_cpio_gz_archive()
{
	if [ $# -lt 1 ]; then
		echo "Not enough arguments, Bye!"
		exit 1
	fi

	if [ ! -d "$1" ]; then
		echo "$1 is not a folder, Bye!"
		exit 1
	fi

	if [ -e "$1.cpio.gz" ]; then
		echo "$1 already exists, Bye!"
		exit 1
	fi

	(cd "$1" && find . | cpio -o -H newc | gzip > ../"$1".cpio.gz)
}

uncompress_cpio_archive()
{
	if [ $# -lt 1 ]; then
		echo "Not enough arguments, Bye!"
		exit 1
	fi

	if [ -d "$1" ]; then
		echo "$1 already exists, Bye!"
		exit 1
	fi

	# check if it ends with .cpio
	FILE=$(basename "$1")
	EXTENSION=${FILE##*.}
	# check with file if is a cpio file
	if [ ! "$EXTENSION" = ".cpio" ]; then
		echo "$1 does not end with .cpio"
	fi

	if [ -e "$1.cpio.gz" ]; then
		echo "$1 already exists, Bye!"
		exit 1
	fi

	(mkdir -v "$1" && cd "$1" && cat ../"$1" | cpio -H newc -idv 2> cpio.log)
}
