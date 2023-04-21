require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(person, date, book = self)
    Rental.new(date, book, person)
    @rentals.push(self) unless @rentals.include?(self)
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(12)

puts person.correct_name
