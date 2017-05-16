require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("Aged Brie", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "Aged Brie"
    end

    context "Aged brie" do
      it "increases the quality by 1" do
        items = [Item.new("Aged Brie", 10, 4)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 5
      end

      it "decreases the sell_in by 1" do
        items = [Item.new("Aged Brie", 10, 4)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 9
      end
    end

    context "Sulfuras, Hand of Ragnaros" do
      it "does not change the quality" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 80
      end

      it "does not change the sell_in" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 10
      end
    end

    context "Backstage passes" do
      it "increases quality by 2 with 10 days left" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 22
      end

      it "increases quality by 3 with 5 days left" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 23
      end

      it "increases quality by 1 with 11 days left" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 21
      end

      it "sets quality to 0 with 0 days left" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
      end

      it "decreases sell_in by one" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 10
      end
    end

    context "Other items" do
      it "decreases in quality by one" do
        items = [Item.new("+5 Dexterity Vest", 10, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 19
      end

      it "decreases sell_in by one" do
        items = [Item.new("+5 Dexterity Vest", 10, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 9
      end
    end

    context "Conjured" do
      it "decreases in quality by two" do
        items = [Item.new("Conjured Mana Cake", 3, 6)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 4
      end

      it "decreases sell_in by one" do
        items = [Item.new("Conjured Mana Cake", 3, 6)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 2
      end
    end
  end
end
