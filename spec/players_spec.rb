require "../lib/players.rb"

describe "#choose_piece" do
  it "gets a valid piece" do
    player1 = Player.new
    expect(player1.choose_piece).to eql("\u2648")
  end
end