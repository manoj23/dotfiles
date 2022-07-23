repo()
{
	local LOCAL_REPO="$PWD/.repo/repo/repo"
	if [ -x $LOCAL_REPO ]; then
		$LOCAL_REPO $@
	else
		$(which repo) $@
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
