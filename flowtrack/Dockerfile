FROM perl

RUN apt-get update && apt-get install sqlite3
RUN cpan Mojolicious \
	Net::Server \
	Log::Log4perl \
	YAML \
	DBI \
	DBD::SQLite \
	Net::Flow \
	Net::IP \
	DateTime \
	Net::DNS \
	List::Util \
	Devel::Cover \
	Test::Pretty 
RUN git clone git://github.com/skarfacegc/FlowTrack.git




