class BackstagePassHandler
  def update_quality(item)
    if item.sell_in < 1
      item.quality = 0
    elsif item.sell_in > 10
      item.quality += 1
    elsif item.sell_in > 5
      item.quality += 2
    elsif item.sell_in <= 5
      item.quality += 3
    end
  end

  def update_sell_in(item)
    item.sell_in -= 1
  end
end
