require 'backstage_pass_handler'
describe BackstagePassHandler do
  describe "#update_quality" do
    it "should increase in quality by 1 with 11 days left" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 20)
      BackstagePassHandler.new.update_quality(item)
      expect(item.quality).to eq 21
    end

    it "should increase in quality by 2 with 10 days left" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 20)
      BackstagePassHandler.new.update_quality(item)
      expect(item.quality).to eq 22
    end

    it "should increase in quality by 3 with 5 days left" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 20)
      BackstagePassHandler.new.update_quality(item)
      expect(item.quality).to eq 23
    end

    it "should set item quality to 0 with 0 days left" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)
      BackstagePassHandler.new.update_quality(item)
      expect(item.quality).to eq 0
    end

    it "cannot increase quality above 50" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 50)
      BackstagePassHandler.new.update_quality(item)
      expect(item.quality).to eq 50
    end
  end

  describe '#update_sell_in' do
    it 'should reduce by 1' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 20)
      BackstagePassHandler.new.update_sell_in(item)
      expect(item.sell_in).to eq 9
    end
  end
end
