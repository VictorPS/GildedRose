require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe "#update_quality" do
    it "Once the sell by date has passed, `Quality` degrades twice as fast" do
      items = [Item.new("Common item", 0, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 8
    end

    it "The `Quality` of an item is never negative" do
      items = [Item.new("Common item", 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end

    it "`Aged Brie` actually increases in `Quality` the older it gets" do
      items = [Item.new("Aged Brie", 1, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 1
    end
  end
end
