repo()
{
	local LOCAL_REPO="$PWD/.repo/repo/repo"
	if [ -x $LOCAL_REPO ]; then
		$LOCAL_REPO $@
	else
		$(which repo) $@
	fi
}

repo_sync()
{
	repo sync -j16 -qc
}
