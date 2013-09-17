class Cell

  attr_accessor :value, :neighbours, :box_id
  ALLOWED_VALUES = (1..9).to_a
  
  def initialize(value=0)
    @neighbours = []
    @value = value
  end

  def filled_in?
    ALLOWED_VALUES.include?(@value)
  end

  def identify_candidates
    ALLOWED_VALUES - @neighbours.uniq
  end

  def fill_in!
    return if (1..9).include?(@value)
    candidates = identify_candidates
    @value = candidates.size == 1 ? candidates[0] : 0
  end

end