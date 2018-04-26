run:
	rails s

install:
	bundle install

reset-db:
	rake db:drop
	rake db:create
	rake db:migrate

erd:
	erd