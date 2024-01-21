module Items
  class AgedBrie
    def initialize(item)
      @item = item
    end

    def update_quality
      @item.sell_in -= 1

      @item.quality += 1 if @item.sell_in >= 0
      @item.quality += 2 if @item.sell_in < 0
      @item.quality = 50 if @item.quality > 50
    end
  end
end
