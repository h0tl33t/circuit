require 'rails_helper'

RSpec.describe Member, type: :model do
  subject { create(:member) }

  it { should belong_to(:user) }
  it { should belong_to(:group) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:group) }

  it { should validate_uniqueness_of(:user_id).scoped_to(:group_id).with_message('already belongs to this group.') }
end
