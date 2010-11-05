#!/usr/bin/env ruby
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'kindle'

unless ARGV[0] && File.exists?(ARGV[0])
  puts "ERROR: need file"
  exit(-1)
end

unless ARGV[1]
  puts "ERROR: need a book name"
  exit(-1)
end

Kindle::File.open(ARGV[0]).parse.books.select {|book|
  book.title.match(Regexp.escape(ARGV[1]))
}.sort.each do |book|
  puts book.title
  book.notes.each do |note|
    puts "- #{note.content}"
  end
  puts
end
