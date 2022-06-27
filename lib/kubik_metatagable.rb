# frozen_string_literal: true

module KubikMetatagable
  class Error < StandardError; end
  # Your code goes here...
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace KubikMetatagable
    end
  end
end

module Kubik
  require "kubik/kubik_metatagable"
  require "kubik/permit_additional_metatagable_admin_params"
end
