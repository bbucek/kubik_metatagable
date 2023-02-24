# frozen_string_literal: true

module Kubik
  module Metatagable
    class Configuration
      attr_accessor :settings_class

      def settings_class
        @settings_class&.constantize || (defined?(Kubik::Setting) ? Kubik::Setting : nil)
      end
    end
  end
end
