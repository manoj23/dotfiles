__cpio_mk()
{
	if [ "$#" -lt 2 ]; then
		echo "Not enough arguments, Bye!"
		return 1
	fi

	if [ ! -d "$2" ]; then
		echo "$1 is not folder, Bye!"
		return 1
	fi

	local compression="$1"
	local cpio_folder="$2"
	local cpio_file="${2%/}.cpio"

	if [ -e "$cpio_file" ]; then
		read -N 1 -e -r -p "$cpio_file already exists, do you want to overwrite it? [y/n]" yn
		
		if [ "x$yn" != "xy" ]; then
			echo "OK, Bye!"
			return 1
		else
			rm "$cpio_file"
		fi
		
	fi

	(cd "$cpio_folder" && find . | cpio -o -H newc > ../"$cpio_file")

	case $compression in
		gz)
		gzip -v -9 "$cpio_file"
		;;
		_)
		;;
	esac

	return 0
}

__cpio_check_directory()
{
	if [ $# -lt 1 ]; then
		echo "Not enough arguments, Bye!"
		return 1
	fi

	local cpio_file="$1"
		
	if [ -d "$cpio_file" ]; then
		read -N 1 -e -r -p "$cpio_file directory already exists, do you want to overwrite it? [y/n]" yn

		if [ "x$yn" != "xy" ]; then
			echo "OK, Bye!"
			return 1
		else
			rm -rf "$cpio_file"
			mkdir "$cpio_file"
		fi
	else
		mkdir "$cpio_file"
	fi
}

cpio_mk()
{
	__cpio_mk _ "$1"
}

cpio_mk_gz()
{
	__cpio_mk gz "$1"
}

cpio_un()
{
	if [ $# -lt 1 ]; then
		echo "Not enough arguments, Bye!"
		return 1
	fi

	if [ ! -e "$1" ]; then
		echo "$1 does not exist, Bye!"
		return 1
	fi

	local cpio_file
	local cpio_file_extension
	local cpio_directory

	cpio_file=$(basename "$1")
	cpio_file_extension=${cpio_file##*.}
	cpio_directory=$(echo "$cpio_file" | cut -d '.' -f 1)
	
	if [ "$cpio_file_extension" = "gz" ]; then
		if __cpio_check_directory "$cpio_directory"; then
			(cd "$cpio_directory" && gunzip "../$cpio_file" -c | sudo cpio -H newc -idv)
		fi
	elif [ "$cpio_file_extension" = "cpio" ]; then
		if __cpio_check_directory "$cpio_directory"; then
			(cd "$cpio_directory" && cat "../$cpio_file" | sudo cpio -H newc -idv)
		fi
	else
		echo "$cpio_file does not end with .cpio nor .cpio.gz, Bye!"
		return 1
	fi
}

cpio_ls()
{
	if [ $# -lt 1 ]; then
		echo "Not enough arguments, Bye!"
		return 1
	fi

	if [ ! -e "$1" ]; then
		echo "$1 does not exist, Bye!"
		return 1
	fi

	local cpio_file=$(basename "$1")
	local cpio_file_extension=${cpio_file##*.}
	if [ "$cpio_file_extension" = "gz" ]; then
		gunzip -c "$1" | cpio -itv
	elif [ "$cpio_file_extension" = "cpio" ]; then
		cpio -itv < "$cpio_file"
	else
		echo "$cpio_file does not end with .cpio nor .cpio.gz, Bye!"
		return 1
	fi
}
