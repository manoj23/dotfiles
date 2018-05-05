cherry_pick()
{
	if [ ! -z "$1" ]; then
		git --git-dir="$CHERRY_PICK_DIR/.git" format-patch -k -1 --stdout "$1" | git am -3 -k;
	fi
}
