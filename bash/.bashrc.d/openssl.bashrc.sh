openssl_rsa_genkey() {
	if [ "$#" -ne 1 ]; then
		echo "Not enough argument, Bye!"
		return 1
	fi

	local keyname="$1"

	if [ -e "${keyname}.pem" ]; then
		echo "${keyname}.pem found, I don't want to overwrite it, Bye!"
		return 2
	fi

	openssl genpkey -algorithm RSA -out "${keyname}.pem" \
		-pkeyopt rsa_keygen_bits:2048 \
		-pkeyopt rsa_keygen_pubexp:65537 \
	&& openssl genrsa -out "${keyname}.pem" 2048
}

openssl_x509_gen_crt() {
	if [ "$#" -ne 1 ]; then
		echo "Not enough argument, Bye!"
		return 1
	fi

	local keyname="$1"

	if [ ! -f "${keyname}.pem" ]; then
		echo "${keyname}.pem not found, Bye!"
		return 2
	fi

	openssl req -batch -new -x509 -key "${keyname}.pem" -out "${keyname}.crt"
}

openssl_rsa_pubkey_der_to_pem()
{
	if [ "$#" -ne 2 ]; then
		echo "Not enough argument, Bye!"
		return 1
	fi

	local pubkey_der=$1
	local pubkey_pem=$2

	if [ ! -f "${pubkey_der}" ]; then
		echo "${pubkey_der} not found, Bye!"
		return 2
	fi

	openssl rsa -in "$pubkey_der" -inform der  -pubin -outform pem -out "$pubkey_pem"
}
