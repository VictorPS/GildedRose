module Items
  class Common
    def initialize(item)
      @item = item
    end

    def update_quality
      @item.sell_in -= 1

      @item.quality -= 1
      @item.quality -= 1 if @item.sell_in < 0
      @item.quality = 0 if @item.quality < 0
    end
  end
end
