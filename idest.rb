#!/usr/bin/env ruby 
require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'ruby-debug'
$: << File.join(File.dirname(__FILE__), 'lib')
require 'idest/models'

use Rack::Session::Cookie, :secret => '1ffe26b187c88daf3ce008fabcf7022d4273f57af84f11307ac5a73529acd6ba'

error do
  e = request.env['sinatra.error']
  puts "#{e.class}: #{e.message}\n#{e.backtrace.join("\n  ")}"
end

configure do
  require File.dirname(__FILE__) + '/config/idest.rb'
end


get '/' do
  login_required
  @users = User.all
  erb "<% @users.each { |user| %>hi <%= user.email %> <br /> <% }%>"
end

get '/logged_in' do
  if session[:user]
    "true"
  else
    "false"
  end
end

get '/login' do
  erb :login
end

post '/login' do
  if user = User.authenticate(params[:email], params[:password])
    session[:user] = user.id
    redirect_to_stored
  else
    redirect '/login'
  end
end

get '/logout' do
  session[:user] = nil
  @message = "in case it weren't obvious, you've logged out"
  redirect '/'
end

get '/signup' do
  erb :signup
end

post '/signup' do
  @user = User.new(:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
  if @user.save
    session[:user] = @user.id
    redirect '/'
  else
    session[:flash] = "failure!"
    redirect '/'
  end
end

delete '/user/:id' do
  user = User.first(params[:id])
  user.delete
  session[:flash] = "way to go, you deleted a user"
  redirect '/'
end

private

def login_required
  if session[:user]
    return true
  else
    session[:return_to] = request.fullpath
    redirect '/login'
    return false 
  end
end

def current_user
  User.first(session[:user])
end

def redirect_to_stored
  if return_to = session[:return_to]
    session[:return_to] = nil
    redirect return_to
  else
    redirect '/'
  end
end
