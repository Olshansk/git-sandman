#!/bin/bash
# exit when any command fails
set -e

if [ $# -eq 0 ]; then
    echo "Example usage: ./update_brew.sh {{tag}}"
    exit 1
fi

# Declare variables
GIT_SANDMAN_VERSION=$1
URL=https://github.com/pokt-network/git-sandman-core/archive/$GIT_SANDMAN_VERSION.tar.gz

# Download and get the shasum256 value
echo "Downloading git-sandman.tar.gz version $GIT_SANDMAN_VERSION"
curl $URL -sL -o git-sandman.tar.gz

# Verify if tag exists
if (($(wc -l <"git-sandman.tar.gz") < 10)); then
    echo "Version $GIT_SANDMAN_VERSION not found"
    exit 1
fi

# Get the shasum 256 value of the git-sandman.tar.gz file
echo "Calculating git-sandman.tar.gz file sha256 value"
SHA_VALUE=$(shasum -a 256 git-sandman.tar.gz | awk -F' ' '{print $1}')

# Change the shasum256 value of the git-sandman formula file
echo "Adding sha256 ($SHA_VALUE) value calculated from git-sandman.tar.gz to git-sandman.rb file"
cat git-sandman.rb | sed "s/sha256.*/sha256 \"$SHA_VALUE\"/" >trash.tst

# Change the url value of the git-sandman formula file
echo "Adding $URL to the git-sandman.rb file"
cat trash.tst | sed "s,url.*,url \"$URL\"," >git-sandman.rb

# Clean the directory
echo "Cleaning directory..."
rm git-sandman.tar.gz trash.tst
echo "Done!"
