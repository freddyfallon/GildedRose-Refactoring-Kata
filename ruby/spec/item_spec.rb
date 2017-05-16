require 'item'
describe Item do
  describe "#to_s" do
    it "should produce strings" do
      item = Item.new("Aged Brie", 10, 4)
      expect(item.to_s).to eq "Aged Brie, 10, 4"
    end
  end
end
