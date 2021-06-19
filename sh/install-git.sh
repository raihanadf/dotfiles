# Generate new SSH key
read -p 'Input your email: ' email
echo "\nThis is your email in the script = ${email}"
sleep 1
echo "\nGenerating SSH\n"
sleep 1
ssh-keygen -t ed25519 -C "${email}"