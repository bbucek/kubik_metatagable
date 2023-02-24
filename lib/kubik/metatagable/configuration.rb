# frozen_string_literal: true

module Kubik
  module Metatagable
    class Configuration
      attr_accessor :settings_class

      def settings_class
        @settings_class.constantize || (defined?(Kubik::Settings) ? Kubik::Settings : nil)
      end
    end
  end
end
