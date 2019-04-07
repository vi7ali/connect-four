class Board

  ROWS = 6
  COLUMNS = 7
  attr_accessor :grid, :win
  
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

  def check_horizontal_win(grid_copy = grid)

    winner = ""
    win_array = []

    grid_copy.each do |row|
      row.each do |cell|
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
    end
    winner
  end

  def check_vertical_win
    grid_copy = grid.transpose
    check_horizontal_win(grid_copy)
  end

  def check_diagonal_win
    win_array = []
    grid_copy = grid
    winner = ""

    COLUMNS.times do |col_index|
      #for every column get the \ diagonal. Vertical size is always a total of rows 
      diag = (0..grid_copy.length-1).collect {|i| grid_copy[i][i+col_index]}
      
      #removing all the nils
      diag.delete_if {|cell| cell.nil?}
      
      #checking the size of the diag, as diag with less than 4 can't have winning combos
      if diag.length >= 4

        diag.each do |cell|
          if cell == " "
            win_array = []
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
      end
    end
    winner  
  end


end

class Player
  def initialize
    
  end
end