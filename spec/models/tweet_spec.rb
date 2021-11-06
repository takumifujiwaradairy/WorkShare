require 'rails_helper'
RSpec.describe Tweet, type: :model do
  feature "tweet" do
    it "Userが存在し、:tatle,:tantou,が存在すれば有効であること" do
      let(:tweet){FactoryBot.build(:tweet)}
      tweet.valid?
      expect(tweet).to be_valid
    end
  end
  feature "untweet" do
    it "Userが存在しても、;tatleが存在しなければ無効であること" do
      untweet = FactoryBot.build(:untweet)
      untweet.valid?
      expect(untweet.errors[:title]).to include("can't be blank")
    end
  end
  feature "untweet2" do
    it "Userが存在しても,;tantouが存在しなければ無効であること" do
      untweet = FactoryBot.build(:untweet2)
      untweet.valid?
      expect(untweet.errors[:tantou]).to include("can't be blank")
    end
  end
end
