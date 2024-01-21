require_relative "../lib/gilded_rose"

describe GildedRose do
  describe "#update_quality" do
    describe "Common item" do
      it "Before the sell by date has passed, `Quality` degrades by 1" do
        items = [Item.new("Common item", 1, 10)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 9
      end

      it "Once the sell by date has passed, `Quality` degrades by 2" do
        items = [Item.new("Common item", 0, 10)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 8
      end

      it "The `Quality` of an item is never negative" do
        items = [Item.new("Common item", 0, 0)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 0
      end

      it "Items sell by date can be negative" do
        items = [Item.new("Common item", 0, 0)]
        GildedRose.new(items).update_quality
        expect(items[0].sell_in).to eq -1
      end
    end

    it "`Aged Brie` actually increases in `Quality` the older it gets" do
      items = [Item.new("Aged Brie", 1, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 1
    end

    it "After the sell by date `Aged Brie` increases in `Quality` times two" do
      items = [Item.new("Aged Brie", 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 2
    end

    it "The `Quality` of an item is never more than `50`" do
      items = [Item.new("Aged Brie", 0, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50
    end

    it "`Sulfuras, Hand of Ragnaros`, being a legendary item, \
        never has to be sold or decreases in `Quality`" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50
    end

    it "`Backstage passes to a TAFKAL80ETC concert` increases in `Quality` \
        the older it gets" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 20, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 1
    end

    it "`Backstage passes to a TAFKAL80ETC concert` increases in `Quality` \
        by `2` after the 10th day the older it gets" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 2
    end

    it "`Backstage passes to a TAFKAL80ETC concert` increases in `Quality` \
        by `3` after the 5th day the older it gets" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 3
    end

    it "`Backstage passes to a TAFKAL80ETC concert` `Quality` drops to `0` \
        after the sell by date" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end

    xit "`Conjured` items degrade in `Quality` twice as fast as normal items" do; end
  end
end
