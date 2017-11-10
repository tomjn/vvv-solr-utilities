#!/usr/bin/env bash
if [[ -f /usr/bin/java ]]; then
	echo "Java is already installed."
	exit 0
fi

echo "Installing Java 8"

# Install prerequisites.
sudo apt-get install -y python-software-properties debconf-utils &>/dev/null
echo "Adding ppa:webupd8team/java repository"
sudo apt-add-repository -y ppa:webupd8team/java &>/dev/null
sudo apt-get update &>/dev/null

# Licensing.
echo "Installing this utility means you have AGREED to the Oracle Binary Code"
echo "License Agreement for Java SE at"
echo "http://www.oracle.com/technetwork/java/javase/terms/license/index.html"
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections

# Install Java.
sudo apt-get install -y oracle-java8-installer
