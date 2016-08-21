require 'rails_helper'

RSpec.describe UserPolicy, type: :policy do
  let(:user)   { create(:user) }
  let(:record) { create(:user) }

  subject { described_class.new(user, record) }

  it { expect(subject).to permit_action(:index) }
  it { expect(subject).to permit_action(:show) }
  it { expect(subject).to permit_action(:new) }
  it { expect(subject).to permit_action(:create) }
  it { expect(subject).to permit_action(:edit) }
  it { expect(subject).to permit_action(:update) }
  it { expect(subject).to forbid_action(:destroy) }
end
