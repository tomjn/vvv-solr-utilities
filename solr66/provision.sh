#!/usr/bin/env bash

SOLR_VERSION='6.6.2'

if [[ -d /opt/solr && $(basename $(readlink -e /opt/solr)) == "solr-${SOLR_VERSION}" ]]; then
	echo "Apache Solr ${SOLR_VERSION} is already installed."
	exit 0
fi

# Check for Java >= 8
echo -n "Checking Java version >= 8..."
if [[ ! -f /usr/bin/java ]]; then
	echo "Apache Solr ${SOLR_VERSION} requires Java." >&2
	exit 1
else
	JAVA_VER=$(java -version 2>&1 | sed 's/java version "\(.*\)\.\(.*\)\..*"/\1\2/; 1q')
	if [[ $JAVA_VER -lt 18 ]]; then
		echo "Apache Solr ${SOLR_VERSION} requires Java 8 or greater." >&2
		exit 1
	fi
fi

cd /opt
echo "Downloading Apache Solr ${SOLR_VERSION}. This may take a while..."
sudo curl -sSL -O "https://www.apache.org/dyn/mirrors/mirrors.cgi?action=download&filename=lucene/solr/${SOLR_VERSION}/solr-${SOLR_VERSION}.tgz"

if [ $? -ne 0 ]; then
	echo "Download of Apache Solr ${SOLR_VERSION} failed." >&2
fi

sudo tar xzf solr-${SOLR_VERSION}.tgz solr-${SOLR_VERSION}/bin/install_solr_service.sh --strip-components=2
sudo bash ./install_solr_service.sh solr-${SOLR_VERSION}.tgz -f -i /opt -d /var/solr -u vagrant -s solr -p 8983
sudo rm install_solr_service.sh solr-${SOLR_VERSION}.tgz
