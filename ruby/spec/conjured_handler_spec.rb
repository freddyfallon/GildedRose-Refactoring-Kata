require 'conjured_handler'
describe ConjuredHandler do
  describe 'update_quality' do
    it 'should reduce quality by 2' do
      item = Item.new("Conjured Mana Cake", 3, 6)
      ConjuredHandler.new.update_quality(item)
      expect(item.quality).to eq 4
    end
  end

  describe 'update_sell_in' do
    it 'should reduce sell_in by 1' do
      item = Item.new("Conjured Mana Cake", 3, 6)
      ConjuredHandler.new.update_sell_in(item)
      expect(item.sell_in).to eq 2
    end
  end
end
