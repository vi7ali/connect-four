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
      expect(board.generate_grid).to eql(grid)
    end
  end
end