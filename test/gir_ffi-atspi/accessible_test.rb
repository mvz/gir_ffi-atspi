# frozen_string_literal: true

require "test_helper"

describe Atspi::Accessible do
  describe "#get_text" do
    it "accepts two arguments" do
      obj = Atspi::Accessible.new

      # NOTE: Without implementation, this would raise an ArgumentError instead
      # TODO: Test this with a more positive case where there is an actual result
      _(proc { obj.get_text(0, -1) })
        .must_raise(GirFFI::GLibError, "The application no longer exists")
    end
  end
end
