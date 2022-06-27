# frozen_string_literal: true

module Kubik
  # Metatags module
  module Metatags
    extend ActiveSupport::Concern

    def insert_kubik_meta_tags(inst_var)
      meta_tags = inst_var.meta_tag
      @kubik_page_title = meta_tags.try(:title_tag)
      @kubik_meta_override = {
        meta_description: meta_tags.try(:meta_description),
        og_title: meta_tags.try(:og_title),
        og_description: meta_tags.try(:og_description),
        og_image: meta_tags.try(:og_image),
        og_url: request.original_url,
        twitter_title: meta_tags.try(:twitter_title),
        twitter_description: meta_tags.try(:twitter_description),
        twitter_image: meta_tags.try(:twitter_media),
        twitter_card_type: meta_tags.try(:twitter_card_type)
      }
    end
  end
end
