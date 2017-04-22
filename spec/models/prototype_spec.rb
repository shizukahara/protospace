require 'rails_helper'

describe Prototype do
  describe '#create' do
    context "with valid attributes" do
      it "is valid with all information" do
        expect(build(:prototype)).to be_valid
      end
  end







    context "without valid attributes" do
      it "is without a title" do
        prototype = build(:prototype, title: "")
        prototype.valid?
        expect(prototype.errors[:title]).to include("can't be blank")
      end

      it "is without a catchcopy" do
        prototype = build(:prototype, catchcopy: "")
        prototype.valid?
        expect(prototype.errors[:catchcopy]).to include("can't be blank")
      end

      it "is without a concept" do
        prototype = build(:prototype, concept: "")
        prototype.valid?
        expect(prototype.errors[:concept]).to include("can't be blank")
      end
    end
  end
end
