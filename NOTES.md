# Notes
These are helpful things that I won't remember, but might use in the future.

Postgres management:
```
~$ sudo -u postgres psql
=# create role rovor_api with createdb login password 'password1';
```

Drop all tables:
```
$ rails db:drop:all
```