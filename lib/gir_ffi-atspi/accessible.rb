# frozen_string_literal: true

Atspi.load_class :Text
Atspi::Text.setup_instance_method(:get_text)

module GirFFIAtspi
  # Overrides for AtspiAccessible methods
  module AccessibleOverrides
    def get_text(start_offset, end_offset)
      Atspi::Text.instance_method(:get_text).bind_call(self, start_offset, end_offset)
    end
  end
end

Atspi.load_class :Accessible
Atspi::Accessible.prepend GirFFIAtspi::AccessibleOverrides
