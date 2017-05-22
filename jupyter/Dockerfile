FROM fzinfz/anaconda3
MAINTAINER Ferro Fang <fzinfz@gmail.com>

RUN apt update && apt install -y openjdk-7-jdk
ENV JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
RUN wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie"  http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip

RUN git clone https://github.com/ligee/kotlin-jupyter.git

# error 
root@4a2bd0ddc53b:/kotlin-jupyter# ./gradlew install
Downloading https://services.gradle.org/distributions/gradle-2.12-all.zip

Exception in thread "main" javax.net.ssl.SSLException: java.security.ProviderException: java.security.InvalidKeyException: EC parameters error
	at sun.security.ssl.Alerts.getSSLException(Alerts.java:208)
	at sun.security.ssl.SSLSocketImpl.fatal(SSLSocketImpl.java:1914)
	at sun.security.ssl.SSLSocketImpl.fatal(SSLSocketImpl.java:1872)
	at sun.security.ssl.SSLSocketImpl.handleException(SSLSocketImpl.java:1855)
	at sun.security.ssl.SSLSocketImpl.startHandshake(SSLSocketImpl.java:1376)
	at sun.security.ssl.SSLSocketImpl.startHandshake(SSLSocketImpl.java:1353)
	at sun.net.www.protocol.https.HttpsClient.afterConnect(HttpsClient.java:559)
	at sun.net.www.protocol.https.AbstractDelegateHttpsURLConnection.connect(AbstractDelegateHttpsURLConnection.java:185)
	at sun.net.www.protocol.http.HttpURLConnection.getInputStream(HttpURLConnection.java:1348)
	at sun.net.www.protocol.https.HttpsURLConnectionImpl.getInputStream(HttpsURLConnectionImpl.java:254)
	at org.gradle.wrapper.Download.downloadInternal(Download.java:58)
	at org.gradle.wrapper.Download.download(Download.java:44)
	at org.gradle.wrapper.Install$1.call(Install.java:61)
	at org.gradle.wrapper.Install$1.call(Install.java:48)


#RUN cd kotlin-jupyter && ./gradlew install


