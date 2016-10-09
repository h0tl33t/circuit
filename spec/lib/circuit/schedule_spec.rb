require 'rails_helper'

RSpec.describe Circuit::Schedule do
  subject { described_class.new }

  describe "#sundays" do
    it "returns the next #{Circuit::Schedule::WEEKS_OUT} Sundays" do
      expect(subject.sundays.size).to eq Circuit::Schedule::WEEKS_OUT
      expect(subject.sundays.all?(&:sunday?)).to eq true
      expect(subject.sundays.all?(&:future?)).to eq true
    end
  end
end
