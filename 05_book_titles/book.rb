require 'pry'

class Book
  
  attr_accessor :title
  
  def initialize
  end
  binding.pry
  def title=(title)
    stop_words = %w{a an and in of the}
    @title = title.capitalize.split.map { |word| stop_words.include?(word) ? word : word.capitalize }.join(' ')
  end
  
end
# binding.pry
# @book = Book.new
# @book.title = "inferno"

