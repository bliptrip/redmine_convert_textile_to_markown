#!/bin/bash
set -e
set -u

apt-get update
apt-get upgrade --yes
apt-get install screen pandoc --yes

pandoc --version

cd /usr/src/redmine

# Enable HTML in redmine
sed -iE 's/filter_html\s*=>\s*true/filter_html => false/' "lib/redmine/wiki_formatting/markdown/formatter.rb"

# Copy conversion rake file script
cp ~/redmine_convert_textile_to_markown/convert_textile_to_markdown.rake lib/tasks/
