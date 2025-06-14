# frozen_string_literal: true

require "test_helper"

describe Atspi::Accessible do
  include Aruba::Api
  include EndToEndTestHelpers

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

      app = find_app("simple_gui.rb")

      frame = app.child_at_index(0)
      box = find_child_with_role(frame, :filler)

      text = box.child_at_index(0)

      _(text.get_text(0, -1)).must_equal("Hello, World!")

      button = box.child_at_index(1)
      button.do_action(0)
    ensure
      app_process.stop
    end
  end
end
