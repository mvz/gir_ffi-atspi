# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "gir_ffi-atspi"

require "minitest/autorun"
require "aruba/api"

module EndToEndTestHelpers
  def find_app(name)
    desktop = Atspi.get_desktop 0
    app = nil
    4.times do
      desktop.child_count.times.reverse_each do |i|
        child = desktop.get_child_at_index(i)
        break app = child if child.name == name
      end
      break if app
    end

    app or raise "Application not found"
  end
end
