# frozen_string_literal: true

require "test_helper"
require "aruba/api"

describe Atspi::Accessible do
  include Aruba::Api

  describe "#get_text" do
    it "accepts two arguments" do
      obj = Atspi::Accessible.new

      # NOTE: Without implementation, this would raise an ArgumentError instead
      _(proc { obj.get_text(0, -1) })
        .must_raise(GirFFI::GLibError, "The application no longer exists")
    end

    it "fetches text in a running application" do
      setup_aruba

      gui_app = File.expand_path("../fixtures/simple_gui.rb", __dir__)
      app_process = run_command "ruby #{gui_app}"

      desktop = Atspi.get_desktop 0
      app = nil
      until app
        desktop.child_count.times.reverse_each do |i|
          child = desktop.get_child_at_index(i)
          break app = child if child.name == "simple_gui.rb"
        end
      end

      frame = app.child_at_index(0)
      box = frame.child_at_index(1)

      text = box.child_at_index(0)
      _(text.get_text(0, -1)).must_equal("Hello, World!")

      button = box.child_at_index(1)
      button.do_action(0)
    ensure
      app_process.stop
    end
  end
end
