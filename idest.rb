#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'

$: << File.join(File.dirname(__FILE__), 'lib')
require 'idest/models'


$0 = __FILE__

error do
  e = request.env['sinatra.error']
  puts "#{e.class}: #{e.message}\n#{e.backtrace.join("\n  ")}"
end

configure do
  require File.dirname(__FILE__) + '/config/idest.rb'
end

