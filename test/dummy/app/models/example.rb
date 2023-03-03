# frozen_string_literal: true

# Dummy Class for testing

class Example < ApplicationRecord
  include ::Kubik::Metatagable
  kubik_metatagable
end
