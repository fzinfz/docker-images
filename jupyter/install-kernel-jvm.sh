echo "deb http://ftp.de.debian.org/debian jessie-backports main" >> /etc/apt/sources.list
	 
apt update
apt install -t jessie-backports -y openjdk-8-jdk-headless openjdk-8-jre-headless ca-certificates-java

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

mkdir _jvm && cd /_jvm

git clone https://github.com/ligee/kotlin-jupyter.git

cd kotlin-jupyter && ./gradlew install
