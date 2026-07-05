require "../spec_helper"

Spectator.describe Term::Cursor do
  describe "#move_to" do
    let(:cursor) { described_class }

    it "moves to home" do
      expect(cursor.move_to).to eq("\e[H")
    end

    it "moves to row and column" do
      expect(cursor.move_to(2, 3)).to eq("\e[3;4H")
    end

    it "moves to named row and column" do
      expect(cursor.move_to(row: 5, column: 10)).to eq("\e[6;11H")
    end
  end
end
