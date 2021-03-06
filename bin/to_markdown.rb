#!/usr/bin/env ruby
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'kindle'
require "kindle/markdown"
require 'fileutils'

unless ARGV[0] && File.exists?(ARGV[0])
  puts "ERROR: need kindle notes file"
  exit(-1)
end

unless ARGV[1]
  puts "ERROR: need destination directory"
  exit(-1)
end

destination_path = ARGV[1]
FileUtils.mkdir_p destination_path

Kindle::File.parse_books(ARGV[0]).each do |book|
  Kindle::Markdown.save(book, destination_path)
end
