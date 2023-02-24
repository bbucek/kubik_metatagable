# frozen_string_literal: true

module Kubik
  module MetatagHelper
    def kubik_page_title
      [kubik_meta_data(:title_tag), @kubik_settings.try(:[], "site_title")]
        .reject(&:blank?)
        .join(@kubik_settings.try(:[], "site_title_separator") || "|")
    end

    def kubik_meta_data(attr)
      meta = kubik_site_meta_data.symbolize_keys.merge(compact_override)
      meta[attr]
    end

    def kubik_site_meta_data
      @kubik_site_meta_data ||=
        if KubikMetatagable.configuration.settings_class.present?
          KubikMetatagable.configuration.settings_class.instance.meta_tag.attributes
        else
          Kubik::MetaTag.new.attributes
        end
    end

    private

    def compact_override
      override = @kubik_meta_override || {}

      override.select do |_, value|
        value.present?
      end
    end
  end
end
