#!/usr/bin/env bash
# deploy maintenance pages

if [ -z "$1" ]
then
  echo "WARNING: Pass 'delete' as an argument to clean the directories."
  exit 0
fi

if [ $1 != "delete" ]
then
  echo "First argument is not given as 'delete'. Exiting script."
  exit 0
fi

echo "Executing..."

echo "Building..."
bundle exec jekyll build
echo "Done."

echo "Cleaning directories.."
sudo rm -rf /var/www/ai.iyyel.io/public_html/*
sudo rm -rf /var/www/alpha.iyyel.io/public_html/*
sudo rm -rf /var/www/beta.iyyel.io/public_html/*
sudo rm -rf /var/www/bin.iyyel.io/public_html/*
sudo rm -rf /var/www/code.iyyel.io/public_html/*
sudo rm -rf /var/www/data.iyyel.io/public_html/*
sudo rm -rf /var/www/dat.iyyel.io/public_html/*
sudo rm -rf /var/www/dev.iyyel.io/public_html/*
sudo rm -rf /var/www/img.iyyel.io/public_html/*
sudo rm -rf /var/www/ml.iyyel.io/public_html/*
sudo rm -rf /var/www/srv.iyyel.io/public_html/*
sudo rm -rf /var/www/sys.iyyel.io/public_html/*
sudo rm -rf /var/www/test.iyyel.io/public_html/*
sudo rm -rf /var/www/tmp.iyyel.io/public_html/*
sudo rm -rf /var/www/usr.iyyel.io/public_html/*
echo "Done."

echo "Copying files..."
sudo cp -r html/* /var/www/ai.iyyel.io/public_html/.
sudo cp -r html/* /var/www/alpha.iyyel.io/public_html/.
sudo cp -r html/* /var/www/beta.iyyel.io/public_html/.
sudo cp -r html/* /var/www/bin.iyyel.io/public_html/.
sudo cp -r html/* /var/www/code.iyyel.io/public_html/.
sudo cp -r html/* /var/www/data.iyyel.io/public_html/.
sudo cp -r html/* /var/www/dat.iyyel.io/public_html/.
sudo cp -r html/* /var/www/dev.iyyel.io/public_html/.
sudo cp -r html/* /var/www/img.iyyel.io/public_html/.
sudo cp -r html/* /var/www/ml.iyyel.io/public_html/.
sudo cp -r html/* /var/www/srv.iyyel.io/public_html/.
sudo cp -r html/* /var/www/sys.iyyel.io/public_html/.
sudo cp -r html/* /var/www/test.iyyel.io/public_html/.
sudo cp -r html/* /var/www/tmp.iyyel.io/public_html/.
sudo cp -r html/* /var/www/usr.iyyel.io/public_html/.
echo "Done."

echo "Cleaning up..."
sudo rm -rf .sass-cache html Gemfile.lock
echo "Done."

echo "Script done."
