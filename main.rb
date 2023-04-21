require_relative 'app'

def main
  puts 'Welcome to the school library store'
  puts '==================================='

  app = App.new

  loop do
    puts 'Please choose any number by entering a number:'
    puts '1 - list all books'
    puts '2 - list all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person ID'
    puts '7 - Exit'

    option = gets.chomp
    case option
    when '1'
      app.list_all_books
    when '2'
      app.list_all_people
    when '3'
      app.create_a_person
    when '4'
      app.create_a_book
    when '5'
      app.create_rental
    when '6'
      app.list_all_rentals_by_id
    end

    break if option == '7'
  end
  puts 'Thank you for using our application'
end

main
