require 'rails_helper'

RSpec.describe Group, type: :model do
  subject { create(:group, name: 'Week 1') }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it { should have_many(:members) }
  it { should have_many(:users).through(:members) }

  context "scopes" do
    let!(:week2) { create(:group, position: 2) }
    let!(:week1) { create(:group, position: 1) }

    describe ".by_position" do
      it { expect(described_class.by_position).to eq [week1, week2] }
    end
  end

  describe "#to_s" do
    it { expect(subject.to_s).to eq 'Week 1' }
  end

  describe "#to_param" do
    it { expect(subject.to_param).to eq 'week-1' }
  end
end
