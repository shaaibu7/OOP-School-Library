require_relative 'person'
require_relative 'student'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'classroom'

class App
  def initialize
    @classroom = []
    @books = []
    @rentals = []
    @people = []
  end

  def list_all_books
    if @books.length.positive?
      @books.each do |book|
        puts "Title of the book is #{book.title} and the author is #{book.author}"
      end
    else
      puts 'Books are unavailable at the moment'
    end
  end

  def list_all_people
    puts 'All people in the school'

    if @people.length.positive?

      @people.each do |person|
        if person.respond_to?('specialization')
          puts "Teacher name is #{person.name}, he is #{person.age} years old"
        else
          puts "Students name is #{person.name}, he is #{person.age} years old"
        end
      end
    else
      puts 'People are unavailable at the moment'
    end
  end

  def create_a_person
    puts 'To create a student input (1) and to create a teacher input (2)'

    person_category = gets.chomp.to_i
    print 'Enter name:'
    name = gets.chomp
    print 'Enter age:'
    age = gets.chomp
    category_person(person_category, name, age)
  end

  def category_person(category, name, age)
    if category == 1
      print 'Enter classroom:'
      classroom = gets.chomp
      print 'Have parent permission? Y/N:'
      parent_permission = gets.chomp
      parent_permission = parent_permission.downcase == 'y'
      classroom = Classroom.new(classroom)
      fresh_student = Student.new(classroom, age, name, parent_permission: parent_permission)
      @people.push(fresh_student)
      puts 'New student created successfully'
    elsif category == 2
      print 'Enter specialization:'
      specialization = gets.chomp
      new_teacher = Teacher.new(age, name, specialization)
      @people.push(new_teacher)
      puts 'New teacher created successfully'
    else
      puts 'Option not available'
    end
  end

  def create_a_book
    print 'Enter the title of the book:'
    title = gets.chomp
    print 'Enter the author of the book:'
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)

    puts "created book successfully with title of #{new_book.title} authored by #{new_book.author.upcase()}"
  end

  def create_rental
    if @books.empty? or @people.empty?
      puts 'There are no books available or registered people at the moment'
      return
    end
    puts 'Select a book from the shelf from the following:'

    @books.each_with_index do |book, index|
      puts "#{index} Title #{book.title}, authored by #{book.author}"
    end
    choice_book = gets.chomp
    choice_book = @books[choice_book.to_i]
    puts 'Select a person to rent the book by id'
    @people.each_with_index do |person, index|
      puts "#{index} #{person.name.upcase()} with id #{person.id} and #{person.age} years old"
    end

    choice_person = gets.chomp
    choice_person = @people[choice_person.to_i]

    puts 'Enter date of rental to keep track of book'

    date = gets.chomp
    rental = Rental.new(date, choice_book, choice_person)

    puts "record for rented book saved successfully"
  end

  def list_all_rentals_by_id
    @people.each do |person|
      puts "ID: #{person.id}, Name: #{person.name.upcase()} and Age #{person.age}"
    end

    if @people.empty?
      puts 'No rental record in the library, you can create one.'
      return

    end

    puts 'Enter person ID:'

    id = gets.chomp.to_i
    person = @people.find { |item| item.id == id }
    puts 'Book rentals'

    if person and person.rentals.length.positive?
      person.rentals.each do |item|
        puts "Name: #{person.name.upcase()} Book: #{item.book.title} authored by #{item.book.author} on the date #{item.date}"
      end
    else
      puts 'No rentals available at the moment'
    end
  end
end
