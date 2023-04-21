require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'
require_relative 'classroom'

# create a classsroom
department = Classroom.new('Computer Science')
department1 = Classroom.new('Statistics')

#  create a student one
student_one = Student.new(department, 21, 'Suleiman', parent_permission: true)
# create a student two
student_two = Student.new(department, 22, 'Rashik', parent_permission: true)
# create a teacher
teacher_one = Teacher.new(department1, 50, 'Singh', parent_permission: true)

# create a book
book_one = Book.new('Forty days in sahara', 'Martin Caplo')
# create a book
book_two = Book.new('The journey of a thousand miles', 'Houston Garry')
# create a book
book_three = Book.new('The Dark', 'Jack Karly')

# create a rental
rental_one = Rental.new('4-12-2023', book_one, student_one)
# create a rental
rental_two = Rental.new('4-11-2023', book_two, student_two)
# create a rental
rental_three = Rental.new('4-11-2023', book_three, teacher_one)

puts 'library books rental details are as follows'
puts '============================================='
puts "1. #{rental_one.person.name} rented the book #{rental_one.book.title} on #{rental_one.date}"
puts "1. #{rental_two.person.name} rented the book #{rental_two.book.title} on #{rental_two.date}"
puts "1. #{rental_three.person.name} rented the book #{rental_three.book.title} on #{rental_three.date}"
