module Items
  class Common
    def initialize(item)
      @item = item
    end

    def update_quality
      @item.sell_in = @item.sell_in - 1
      if @item.quality > 0
        @item.quality = @item.quality - 1
      end
      if @item.sell_in < 0
        if @item.quality > 0
          @item.quality = @item.quality - 1
        end
      end
    end
  end
end
