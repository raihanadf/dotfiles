# intall ruby build plugin
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

# install ruby
rbenv install 2.7.2 --verbose
rbenv global 2.7.2
