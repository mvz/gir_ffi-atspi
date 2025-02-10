# frozen_string_literal: true

require "test_helper"

describe GirFFIAtspi do
  it "has a version number" do
    _(GirFFIAtspi::VERSION).wont_be_nil
  end
end
