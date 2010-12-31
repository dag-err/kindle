module Kindle
  class Book
    include Enumerable
    
    attr_accessor :title
    attr_accessor :notes
    attr_accessor :author
    
    def to_s
      "<Kindle::Book title=#{@title} >"
    end

    def <=>(v)
      self.title <=> v.title
    end

    def to_document
      {
        :title => @title,
        :author => @author,
        :notes => @notes.collect {|note| "* #{note.content}"}
      }
    end

    def self.parse_from_kindle(kindle_note)
      book = Book.new
      book.title = BookTitle.from_kindle_format(kindle_note)
      book.author = BookAuthor.from_kindle_format(kindle_note)
      book.notes ||= []
      book
    end

    def self.parse(content)
      book = Book.new
      book.title = content
      book
    end
  end

end
