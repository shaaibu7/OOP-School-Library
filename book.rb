class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date, book = self)
    Rental.new(date, book, person)
    @rentals.push(self) unless @rentals.include?(self)
  end
end
