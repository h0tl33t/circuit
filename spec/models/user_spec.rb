require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user, name: 'Bill') }

  let!(:leader) { create(:user, :leader, name: 'Phil') }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:role) }

  it { should validate_uniqueness_of(:name) }

  it { should validate_inclusion_of(:role).in_array(User::ROLES) }

  context "scopes" do
    describe ".volunteer" do
      it { expect(described_class.volunteer).to eq [subject] }
    end

    describe ".leader" do
      it { expect(described_class.leader).to eq [leader] }
    end
  end

  describe "#to_s" do
    it { expect(subject.to_s).to eq 'Bill' }
  end

  describe "#to_param" do
    it { expect(subject.to_param).to eq 'bill' }
  end

  describe "#volunteer?" do
    it { expect(subject.volunteer?).to eq true }
    it { expect(leader.volunteer?).to eq false }
  end

  describe "#leader?" do
    it { expect(subject.leader?).to eq false }
    it { expect(leader.leader?).to eq true }
  end
end
