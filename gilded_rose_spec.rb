require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe "#update_quality" do
    it "Once the sell by date has passed, `Quality` degrades twice as fast" do
      items = [Item.new("Common item", 0, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 8
    end
  end
end
