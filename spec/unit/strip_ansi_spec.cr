require "../spec_helper"

Spectator.describe Term::Cursor do
  let(:cursor) { described_class }

  describe ".strip_ansi" do
    it "leaves plain text unchanged" do
      expect(cursor.strip_ansi("plain text")).to eq("plain text")
    end

    it "strips color sequences" do
      expect(cursor.strip_ansi("\e[31mred\e[0m")).to eq("red")
    end

    it "strips multiple CSI sequences" do
      expect(cursor.strip_ansi("\e[2K\e[1;5Htext")).to eq("text")
    end

    it "strips two-byte escape sequences" do
      expect(cursor.strip_ansi("\e7saved\e8")).to eq("saved")
    end

    it "does not strip literal brackets" do
      expect(cursor.strip_ansi("[not-an-escape]")).to eq("[not-an-escape]")
    end
  end
end
