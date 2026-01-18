# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "gir_ffi-atspi"

require "minitest/autorun"
require "aruba/api"

module EndToEndTestHelpers
  def find_app(name)
    desktop = Atspi.get_desktop 0

    # Wait for about 10 seconds in CI and 0.5 seconds locally
    tries = ENV["CI"] ? 100 : 5
    tries.times do
      sleep 0.1
      desktop.child_count.times.reverse_each do |i|
        child = desktop.get_child_at_index(i)
        return child if child.name == name
      end
    end

    raise "Application not found"
  end

  def find_child_with_role(parent, role)
    parent.child_count.times do |i|
      child = parent.child_at_index(i)
      return child if child.role == role
    end

    nil
  end
end
