FROM fzinfz/alpine

RUN git clone https://github.com/ntop/ntopng.git

RUN cd ntopng && \
    ./autogen.sh && \
    ./configure && make && make install
