require 'aged_brie_handler'
describe AgedBrieHandler do

  describe '#update_quality' do
    it "should increase quality by 1 if sell_in is above 0" do
      item = Item.new("Aged Brie", 10, 4)
      AgedBrieHandler.new.update_quality(item)
      expect(item.quality).to eq 5
    end

    it "should increase quality by 2 if sell_in is 0" do
      item = Item.new("Aged Brie", 0, 4)
      AgedBrieHandler.new.update_quality(item)
      expect(item.quality).to eq 6
    end

    it "cannot increase quality above 50" do
      item = Item.new("Aged Brie", 10, 50)
      AgedBrieHandler.new.update_quality(item)
      expect(item.quality).to eq 50
    end
  end

  describe '#update_sell_in' do
    it "should decrease sell_in by 1" do
      item = Item.new("Aged Brie", 10, 4)
      AgedBrieHandler.new.update_sell_in(item)
      expect(item.sell_in).to eq 9
    end
  end

end
