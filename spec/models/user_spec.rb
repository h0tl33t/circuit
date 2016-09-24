require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user, name: 'Bill') }

  let!(:leader) { create(:user, :leader, name: 'Phil') }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:role) }

  it { should validate_uniqueness_of(:name) }

  it { should validate_inclusion_of(:role).in_array(User::ROLES) }

  it { should allow_value(true).for(:active) }
  it { should allow_value(false).for(:active) }
  it { should_not allow_value(nil).for(:active) }

  context "scopes" do
    let!(:inactive) { create(:user, :inactive) }

    describe ".volunteer" do
      it { expect(described_class.volunteer).to eq [subject] }
    end

    describe ".leader" do
      it { expect(described_class.leader).to eq [leader] }
    end

    describe ".active" do
      it { expect(described_class.active).to match_array [subject, leader] }
    end

    describe ".inactive" do
      it { expect(described_class.inactive).to match_array [inactive] }
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

  describe "#activate" do
    let!(:inactive) { create(:user, :inactive) }

    it "changes the users active status to true" do
      expect { inactive.activate }.to change { inactive.active? }.from(false).to(true)
    end
  end

  describe "#deactivate" do
    it "changes the users active status to false" do
      expect { subject.deactivate }.to change { subject.active? }.from(true).to(false)
    end
  end

  describe "#inactive?" do
    let!(:inactive) { create(:user, :inactive) }

    it { expect(subject.inactive?).to eq false }
    it { expect(inactive.inactive?).to eq true }
  end
end
