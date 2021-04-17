gerrit_get_gerrit_cherry_pick()
{
	if [ -e "$GERRIT_PORT" ]; then
		echo "Please define \$GERRIT_PORT, Bye!"
	fi

	if [ -e "$GERRIT_ADDR" ]; then
		echo "Please define \$GERRIT_ADDR, Bye!"
	fi

	scp -p -P "$GERRIT_PORT" "$GERRIT_ADDR":bin/gerrit-cherry-pick ~/bin
}

gerrit()
{
	if [ -e "$GERRIT_PORT" ]; then
		echo "Please define \$GERRIT_PORT, Bye!"
	fi

	if [ -e "$GERRIT_ADDR" ]; then
		echo "Please define \$GERRIT_ADDR, Bye!"
	fi

	ssh -p "$GERRIT_PORT" "$GERRIT_ADDR" "gerrit" "$@"
}
