# Generate new SSH key
email="12584890+17radf@users.noreply.github.com"
echo "This is your email in the script = ${email}"
sleep 1
echo "\nGenerating SSH\n"
sleep 1
ssh-keygen -t ed25519 -C "${email}"

# Output public key
echo "\n\nThis is your SSH key : \n"
cat ~/.ssh/id_ed25519.pub
echo "\nCopy your key here (CTRL + M1) : https://github.com/settings/ssh/new\n"