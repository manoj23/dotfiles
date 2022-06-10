read_dtb()
{
	if [ -f "$1" ]; then
		dtc -I dtb -O dts "$1" | less
	else
		echo "File \"$1\" does no exist"
	fi
}

kernel_sign_module()
{
	if [ -n "$1" ]; then
		MPATH="$1"
	else
		MPATH="$PWD/drivers/usb/class/"
	fi

	(cd /lib/modules/"$(uname -r)"/build/certs || return)

	sudo tee x509.genkey > /dev/null << 'EOF'
[ req ]
default_bits = 4096
distinguished_name = req_distinguished_name
prompt = no
string_mask = utf8only
x509_extensions = myexts
[ req_distinguished_name ]
CN = Modules
[ myexts ]
basicConstraints=critical,CA:FALSE
keyUsage=digitalSignature
subjectKeyIdentifier=hash
authorityKeyIdentifier=keyid
EOF

	sudo openssl req -new -nodes -utf8 -sha512 -days 36500 -batch -x509 -config x509.genkey -outform DER -out signing_key.x509 -keyout signing_key.pem
	make -C /lib/modules/"$(uname -r)"/build M="$MPATH" modules
	sudo make -C /lib/modules/"$(uname -r)"/build M="$MPATH" modules_install
}
