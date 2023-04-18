require './base_decorator'

class Trimmer < Decorator
  def correct_name
    super()
    @nameable.correct_name.length > 10 ? @nameable.correct_name[1...10] : @nameable.correct_name
  end
end
