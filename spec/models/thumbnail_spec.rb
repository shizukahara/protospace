require 'rails_helper'

describe Thumbnail do
  describe '#create' do
    describe "with valid attributes" do
      it "has a valid factory" do
        thumbnail = build(:thumbnail, :main)
        expect(thumbnail).to be_valid
      end
    end

#     describe "without image_url attribute" do
#      it "returns error" do
#        thumbnail = build(:thumbnail, image_url: nil)
#        thumbnail.valid?
#        expect(thumbnail.errors[:image_url]).to include("can't be blank")
#      end
#   end

    describe "without status attribute" do
      it "returns error" do
        thumbnail = build(:thumbnail, status: nil)
        thumbnail.valid?
        expect(thumbnail.errors[:status]).to include("can't be blank")
      end
    end
  end
end

