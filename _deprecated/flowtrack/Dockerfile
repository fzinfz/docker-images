FROM perl

RUN apt-get update && apt-get install sqlite3

RUN git clone git://github.com/skarfacegc/FlowTrack.git
WORKDIR /root/FlowTrack
RUN curl -LO http://xrl.us/cpanm
RUN perl cpanm --installdeps .



