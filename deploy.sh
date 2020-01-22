# iyyel.io deployment script
echo "Deployment started..."

echo "Building..."
bundle exec jekyll build
echo "Done."

echo "Copying new files..."
sudo rm -rf /var/www/iyyel.io/html/*
sudo cp -r html/* /var/www/iyyel.io/html/.
echo "Done."

echo "Cleaning up..."
sudo rm -rf .sass-cache html Gemfile.lock
echo "Done."

echo 'Deployment finished.'
