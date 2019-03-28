class Board
  attr_accessor :grid
  
  def initialize
    @grid = generate_grid
  end

  def generate_grid
    grid = []
    6.times do
      row = []
      7.times do        
        row.push(" ")
      end
      grid.push(row)
    end
    grid
  end

  
end