require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user, name: 'Bill') }

  it { should validate_presence_of(:name) }

  it { should validate_uniqueness_of(:name) }

  describe "#to_s" do
    it { expect(subject.to_s).to eq 'Bill' }
  end

  describe "#to_param" do
    it { expect(subject.to_param).to eq 'bill' }
  end
end
