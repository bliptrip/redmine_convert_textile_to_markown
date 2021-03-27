#!/bin/bash
set -e
set -u

apt update
apt upgrade --yes
apt install screen pandoc --yes

pandoc --version

cd /usr/src/redmine

# Enable HTML in redmine
sed -iE 's/filter_html\s*=>\s*true/filter_html => false/' "lib/redmine/wiki_formatting/markdown/formatter.rb"

# Copy conversion rake file script
cp ~/redmine_convert_textile_to_markown/convert_textile_to_markdown.rake lib/tasks/

# Run the conversion
bundle exec rake convert_textile_to_markdown RAILS_ENV=production
