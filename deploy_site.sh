# iyyel.io deployment script
bundle exec jekyll build
sudo rm -rf /var/www/iyyel.io/public_html/*
sudo cp -r html/* /var/www/iyyel.io/public_html/.
sudo rm -rf .sass-cache html Gemfile.lock
echo 'Deployment finished.'
