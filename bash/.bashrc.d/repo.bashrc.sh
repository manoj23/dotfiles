repo()
{
	if command -v python3 > /dev/null 2>&1; then
		PYTHON=python3
	elif command -v python > /dev/null 2>&1; then
		PYTHON=python
	else
		PYTHON=
	fi

	local LOCAL_REPO="$PWD/.repo/repo/repo"
	if [ -x $LOCAL_REPO ]; then
		$PYTHON $LOCAL_REPO $@
	else
		$PYTHON $(__which repo) $@
	fi
}

repo_install()
{
	mkdir -p ~/.bin
	curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.bin/repo
	chmod a+rx ~/.bin/repo
}

repo_sync()
{
	repo sync -j16 -qc "$@"
}
