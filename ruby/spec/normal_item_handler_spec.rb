require 'normal_item_handler'

describe NormalItemHandler do
  describe "#update_quality" do
    it "should reduce quality by 1 if sell_in above 0" do
      item = Item.new("+5 Dexterity Vest", 10, 10)
      NormalItemHandler.new.update_quality(item)
      expect(item.quality).to eq 9
    end

    it "should reduce quality by 2 if sell_in is 0" do
      item = Item.new("+5 Dexterity Vest", 0, 10)
      NormalItemHandler.new.update_quality(item)
      expect(item.quality).to eq 8
    end
  end

  describe "#update_sell_in" do
    it "should reduce sell_in by 1" do
      item = Item.new("+5 Dexterity Vest", 10, 10)
      NormalItemHandler.new.update_sell_in(item)
      expect(item.sell_in).to eq 9
    end
  end

end
