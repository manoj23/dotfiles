google_java_format()
{
	if [ -e ~/tools/google-java-format-1.10.0-all-deps.jar ]; then
		java -jar ~/tools/google-java-format-1.10.0-all-deps.jar "$@"
	else
		echo "Please install google-java-format in ~/tools/, Bye!"
	fi
}
