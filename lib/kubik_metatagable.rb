# frozen_string_literal: true

require "activeadmin"

module KubikMetatagable
  class Error < StandardError; end
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= ::Kubik::Metatagable::Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace KubikMetatagable
    end
  end
end

module Kubik
  require "kubik/metatagable"
  require "kubik/metatagable/controller_methods"
  require "kubik/metatagable/configuration"
  require "kubik/permit_additional_metatagable_admin_params"
end
