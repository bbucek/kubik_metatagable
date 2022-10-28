# frozen_string_literal: true

module KubikMetatagable
  class Error < StandardError; end

  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace KubikMetatagable
    end
  end
end

module Kubik
  require "kubik/metatagable"
  require "kubik/metatagable/controller_methods"
  require "kubik/permit_additional_metatagable_admin_params"
end
