FROM fzinfz/anaconda3
MAINTAINER Ferro Fang <fzinfz@gmail.com>

RUN apt update && apt install -y openjdk-7-jdk
RUN git clone https://github.com/ligee/kotlin-jupyter.git


RUN cd kotlin-jupyter && ./gradlew install


