require File.join(File.dirname(__FILEf__),"..","idest.rb")

set :run, false
set :env, ENV['APP_ENV'] || :production

run Sinatra.application
