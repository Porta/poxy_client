#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc "Run tests"
task :default => :test

task :console do
  require 'irb'
  require 'irb/completion'
  require 'poxy_client' # You know what to do.
  ARGV.clear
  IRB.start
end