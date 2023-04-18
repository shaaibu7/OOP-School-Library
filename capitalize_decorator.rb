require './base_decorator'

class Capitalize < Decorator
  def correct_name
    super()
    @nameable.correct_name.capitalize
  end
end
