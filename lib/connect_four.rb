class Board

  ROWS = 6
  COLUMNS = 7
  attr_accessor :grid
  
  def initialize
    @grid = generate_grid
  end

  def generate_grid
    self.grid = []

    ROWS.times do
      row = []
      COLUMNS.times do        
        row.push(" ")
      end
      self.grid.push(row)
    end

    grid
  end
  
  def update_grid(column,color)
    if is_valid_move?(column)
      self.grid[get_row][column] = color
      grid
    end
  end

  def is_valid_move?(c)
    r = 0
    while(r < ROWS)
      return true if grid[r][c] == " "
      r += 1
    end
    return false
  end

  def get_row
    return 2
  end

end