require 'sulfuras_handler'
describe SulfurasHandler do
  describe '#update_quality' do
    it 'should not change the quality' do
      item = Item.new("Sulfuras, Hand of Ragnaros", 10, 10)
      SulfurasHandler.new.update_quality(item)
      expect(item.quality).to eq 10
    end
  end

  describe '#update_sell_in' do
    it 'should not update sell_in' do
      item = Item.new("Sulfuras, Hand of Ragnaros", 10, 10)
      SulfurasHandler.new.update_sell_in(item)
      expect(item.quality).to eq 10
    end
  end
end
