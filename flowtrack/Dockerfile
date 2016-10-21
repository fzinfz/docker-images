FROM perl

RUN apt-get update && apt-get install sqlite3

RUN curl -LO http://xrl.us/cpanm
RUN git clone git://github.com/skarfacegc/FlowTrack.git
RUN perl cpanm --installdeps .



