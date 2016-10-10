require 'rubygems'
require 'sinatra'
require 'pg'

set :bind, '0.0.0.0'

db_params = {
:host => '192.168.131.17',
:dbname => 'sinatra',
:port => '5432',
:user => 'mao',
:password => 'maomao'
}

Psql = PG::Connection.new(db_params)

get '/' do
  res = Psql.exec_params('SELECT * FROM presentaciones;')
  valores = res.field_values('fecha')
end
