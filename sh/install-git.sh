# Generate new SSH key
read -p 'Input your email: ' email
echo "\nThis is your email in the script = ${email}"
ssh-keygen -t ed25519 -C "${email}"