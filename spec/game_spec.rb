require "../lib/main.rb"

describe "#initialize" do
  it "player's piece goes to the right spot" do
    expect(Game.new(7).gameboard[6]).to eql(["O", "O", "O", "O", "O", "O", "X"])
  end
end

