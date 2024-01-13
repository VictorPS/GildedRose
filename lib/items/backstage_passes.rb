module Items
  class BackstagePasses
    def initialize(item)
      @item = item
    end

    def update_quality
      @item.sell_in = @item.sell_in - 1

      if @item.quality < 50
        @item.quality = @item.quality + 1
        if @item.sell_in < 11
          if @item.quality < 50
            @item.quality = @item.quality + 1
          end
        end
        if @item.sell_in < 6
          if @item.quality < 50
            @item.quality = @item.quality + 1
          end
        end
      end
      if @item.sell_in < 0
        @item.quality = @item.quality - @item.quality
      end
    end
  end
end
