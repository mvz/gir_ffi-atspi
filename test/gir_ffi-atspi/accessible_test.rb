# frozen_string_literal: true

require "test_helper"

describe Atspi::Accessible do
  describe "#get_text" do
    it "gets text and not the text interface" do
      skip "Implement this next"
      obj = Atspi::Accessible.new
      _(obj.get_text(0, -1)).must_equal ""
    end
  end
end
