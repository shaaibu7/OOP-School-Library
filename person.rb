class Person
  attr_accessor :id, :name, :age
  def initialize(name = "Unknown", age, parent_permission = true)
    @id = Random.rand(1..200)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end
end