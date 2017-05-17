require_relative 'item'

class GildedRose
  attr_reader :conjured_handler, :backstage_pass_handler,
  :sulfuras_handler, :aged_brie_handler, :normal_item_handler

  def initialize(items)
    @items = items
    @conjured_handler = ConjuredHandler.new
    @backstage_pass_handler = BackstagePassHandler.new
    @sulfuras_handler = SulfurasHandler.new
    @aged_brie_handler = AgedBrieHandler.new
    @normal_item_handler = NormalItemHandler.new
  end

  def update_quality()
    @items.each do |item|
      if item.name.downcase.include? "brie"
        aged_brie_handler.update_quality(item)
        aged_brie_handler.update_sell_in(item)
      elsif item.name.downcase.include? "sulfuras"
        sulfuras_handler.update_quality(item)
        sulfuras_handler.update_sell_in(item)
      elsif item.name.downcase.include? "backstage"
        backstage_pass_handler.update_quality(item)
        backstage_pass_handler.update_sell_in(item)
      elsif item.name.downcase.include? "conjured"
        conjured_handler.update_quality(item)
        conjured_handler.update_sell_in(item)
      else
        normal_item_handler.update_quality(item)
        normal_item_handler.update_sell_in(item)
      end
    end
  end
end
