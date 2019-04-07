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
  
  def update_grid(column, color)
    if is_valid_move?(column)
      row = get_row(column)
      self.grid[row][column] = color
      grid
    end
  end

  def is_valid_move?(column)
    row = 0
    while(row < ROWS)
      return true if grid[row][column] == " "
      row += 1
    end
    return false
  end

  def get_row(column)
    row = 0
    while(row < ROWS)
      return row if grid[row][column] == " "
      row += 1
    end
  end

  ##################--WIN CHECKS--#####################
  
  def check_horizontal_win(grid_copy = grid)
    #every row of the grid is passed to check_logic, the method in charge
    #of returning the winner color or empty string
    grid_copy.each do |row|
      winner = check_logic(row)
      return winner if !winner.empty?      
    end
    return ""
  end

  def check_vertical_win
    #vertical is the same as horizontal but with the grid transposed
    check_horizontal_win(grid.transpose)
  end

  def check_diagonal_win(grid_copy = grid)

    COLUMNS.times do |col_index|
      #for every column get the \ diagonal. Vertical size is always a total of rows 
      diag = (0..grid_copy.length-1).collect {|i| grid_copy[i][i+col_index]}
      
      #removing all the nils that were added as a result of invalid array indexes provided to the collect above
      diag.delete_if {|cell| cell.nil?}
      
      #checking the size of the diag, as diag with less than 4 can't have winning combos
      if diag.length >= 4
        winner = check_logic(diag)
        return winner if !winner.empty?        
      end
    end

    return ""  
  end

  def check_reverse_diagonal_win
    #the / diagonal check is the same as \, but with the cells in each row reversed
    #so I mirror the position of each cell in the grid.
    reversed_grid = grid
    reversed_grid.each_with_index {|row, index| reversed_grid[index] = row.reverse}
    check_diagonal_win(reversed_grid)
  end

  def check_logic(line)

    win_array = []
    winner = ""

    line.each do |cell|
      #if the cell is empty then everything before it doesn't matter
      if cell == " "
        win_array=[] 
      else
        win_array.push(cell)
      end

      if win_array.length == 4
        if win_array.all? {|cell| cell=="r"} || win_array.all? {|cell| cell=="y"}
          winner = cell            
        else          
          win_array.slice!(0)
        end
      end
    end
    return winner
  end

end