require_relative "./items/sulfuras"
require_relative "./items/aged_brie"
require_relative "./items/backstage_passes"
require_relative "./items/common"

# The idea of this Kata is that we are working with a legacy system and there
# are a few pieces of code that we shouldn't modify.
# In this case, we are not allowed to change the arguments of the initialize
# and update_quality methods.
class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.name == "Sulfuras, Hand of Ragnaros"
        next Items::Sulfuras.new(item).update_quality
      elsif item.name == "Aged Brie"
        next Items::AgedBrie.new(item).update_quality
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        next Items::BackstagePasses.new(item).update_quality
      else
        next Items::Common.new(item).update_quality
      end
    end
  end
end

##############################
# THIS BELONGS TO THE GOBLIN #
#      DO NOT CHANGE IT      #
##############################
class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
