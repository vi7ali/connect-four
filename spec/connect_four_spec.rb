require './lib/connect_four'

RSpec.describe "Connect Four" do
  describe Board do
    let(:board) { Board.new }
    let(:grid) {[ 
                  [" ", " ", " ", " ", " ", " ", " "],
                  [" ", " ", " ", " ", " ", " ", " "],
                  [" ", " ", " ", " ", " ", " ", " "],
                  [" ", " ", " ", " ", " ", " ", " "],
                  [" ", " ", " ", " ", " ", " ", " "],
                  [" ", " ", " ", " ", " ", " ", " "]
                ]}
    
    it "generates the grid" do
      expect(board.grid.length).to_not eql(0)
    end

    it "generates the grid of 7 columns and 6 rows"do
      expect(board.grid).to eql(grid)
    end

    it "updates the grid" do
      grid[2][6] = "r"
      expect(board.update_grid(6,"r")).to eql(grid)
    end

    it "checks for valid move" do
      6.times {|index| board.grid[index][0] = "r"}
      expect(board.is_valid_move?(0)).to eql(false)
    end
  end
end