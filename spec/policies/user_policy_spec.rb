require 'rails_helper'

RSpec.describe UserPolicy, type: :policy do
  let(:user)   { create(:user) }
  let(:record) { create(:user) }

  subject { described_class.new(user, record) }

  it { expect(subject).to permit_action(:index) }
  it { expect(subject).to permit_action(:show) }
  it { expect(subject).to permit_action(:new) }
  it { expect(subject).to permit_action(:create) }
  it { expect(subject).to forbid_action(:edit) }
  it { expect(subject).to forbid_action(:update) }
  it { expect(subject).to forbid_action(:destroy) }

  describe "modifying their own user record" do
    subject { described_class.new(user, user) }

    it { expect(subject).to permit_action(:index) }
    it { expect(subject).to permit_action(:show) }
    it { expect(subject).to permit_action(:new) }
    it { expect(subject).to permit_action(:create) }
    it { expect(subject).to permit_action(:edit) }
    it { expect(subject).to permit_action(:update) }
    it { expect(subject).to forbid_action(:destroy) }
  end

  describe "when the user is a leader" do
    let(:user) { create(:user, :leader) }

    it { expect(subject).to permit_action(:index) }
    it { expect(subject).to permit_action(:show) }
    it { expect(subject).to permit_action(:new) }
    it { expect(subject).to permit_action(:create) }
    it { expect(subject).to permit_action(:edit) }
    it { expect(subject).to permit_action(:update) }
    it { expect(subject).to forbid_action(:destroy) }
  end

  describe "when the user is inactive" do
    let!(:inactive) { create(:user, :inactive) }

    it "raises an error on initialization of the policy" do
      expect { described_class.new(inactive, record) }.to raise_error(Pundit::NotAuthorizedError)
    end
  end
end
