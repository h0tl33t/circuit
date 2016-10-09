require 'rails_helper'

RSpec.describe Circuit::ServiceDay do
  let!(:week1) { create(:group, name: 'Week 1', position: 1) }
  let!(:week2) { create(:group, name: 'Week 2', position: 2) }
  let(:date)   { Date.new(2016, 10, 9).in_time_zone }

  subject { described_class.new(date) }

  describe "#ordinality" do
    it "returns the position of the given date in the set of Sundays in the month" do
      expect(subject.ordinality).to eq 2
    end
  end

  describe "#group" do
    it "returns the group based on the ordinality of the given Sunday" do
      expect(subject.group).to eq week2
    end

    context "when its the 3rd Sunday of a month and there's less than 3 groups" do
      let(:third_sunday) { date + 1.week }

      subject { described_class.new(third_sunday) }

      it "assigns the first group again" do
        expect(subject.group).to eq week1
      end
    end
  end
end
