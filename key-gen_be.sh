!#/bin/bash

# key-gen 

#write preset:
cat > /path/to/.gnupg/gen_foo <<EOF
	5echo "Try to generate RSA key-pair
	Key-Type: RSA
	Key-Length: 2048
	Expire-Date: 0
	Name-Real: backendftp
	Name-Email: ""
	Name-Comment: ""
	Passphrase: ********
	%commit
	%echo done
EOF
sudo gpg --batch --gen-key /path/to/.nupg/gen_foo
