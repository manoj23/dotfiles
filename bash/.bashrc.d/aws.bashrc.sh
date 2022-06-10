cdk_bootstrap()
{
	if [ -n "$AWS_ID" ]; then
		echo "Please export AWS_ID, Bye"
		exit 1
	fi

	if [ -x "$AWS_REGION" ]; then
		echo "Please export AWS_REGION, Bye!"
		exit 1
	fi

	cdk bootstrap "aws://$AWS_ID/$AWS_REGION"
}
