PROJECT = folsom_cowboy
DEPS = cowboy folsom ibrowse
dep_cowboy = git https://github.com/ninenines/cowboy master
dep_folsom = git https://github.com/boundary/folsom master
dep_ibrowse = git https://github.com/cmullaparthi/ibrowse v2.2.0

include erlang.mk
