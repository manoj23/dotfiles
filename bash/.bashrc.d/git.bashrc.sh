cherry_pick()
{
	if [ -n "$1" ]; then
		git --git-dir="$CHERRY_PICK_DIR/.git" format-patch -k -1 --stdout "$1" | git am -3 -k;
		if [ $? ]; then
			git commit --amend -m "$(git log --format=%B -n 1)
(cherry picked from commit $1)"
		else
			echo "Copy/paste (cherry picked from commit $1)"
		fi
	fi
}
