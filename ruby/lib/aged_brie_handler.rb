class AgedBrieHandler
  def update_quality(item)
    if item.quality == 50
      item.sell_in
    elsif item.sell_in > 0
      item.quality += 1
    else
      item.quality += 2
    end
  end

  def update_sell_in(item)
    item.sell_in -= 1
  end
end
