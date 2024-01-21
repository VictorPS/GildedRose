module Items
  class BackstagePasses
    def initialize(item)
      @item = item
    end

    def update_quality
      @item.sell_in -= 1

      @item.quality += 1 if @item.quality < 50
      @item.quality += 1 if @item.sell_in < 10 && @item.quality < 50
      @item.quality += 1 if @item.sell_in < 5 && @item.quality < 50
      @item.quality = 0  if @item.sell_in < 0
    end
  end
end
