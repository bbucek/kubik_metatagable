# frozen_string_literal: true

module Kubik
  module MetatagHelper
    def kubik_page_title
      [@kubik_page_title, @kubik_settings.try(:[], "site_title")]
        .reject(&:blank?)
        .join(" - ")
    end

    def kubik_meta_data(attr)
      meta = kubik_settings.symbolize_keys.merge(compact_override)
      meta[attr]
    end

    def kubik_settings
      @kubik_settings || {
        meta_description: nil,
        og_title: nil,
        og_description: nil,
        og_image: nil,
        og_url: request.original_url,
        twitter_title: nil,
        twitter_description: nil,
        twitter_image: nil,
        twitter_card_type: nil
      }
    end

    private

    def compact_override
      override =  @kubik_meta_override || {}

      override.select do |_, value|
        value.present?
      end
    end
  end
end
