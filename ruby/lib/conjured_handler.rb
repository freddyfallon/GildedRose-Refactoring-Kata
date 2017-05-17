class ConjuredHandler
  def update_quality(item)
    item.quality -= 2
  end

  def update_sell_in(item)
    item.sell_in -= 1
  end
end
