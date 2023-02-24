# frozen_string_literal: true

module Kubik
  module Metatagable
    module ControllerMethods
      def insert_kubik_meta_tags(metatagable)
        meta_tags = metatagable.meta_tag || Kubik::MetaTag.new
        @kubik_meta_override = {
          title_tag: meta_tags.title_tag,
          meta_description: meta_tags.meta_description,
          og_title: meta_tags.og_title,
          og_description: meta_tags.og_description,
          og_image: meta_tags.try(:og_image_upload) || meta_tags.try(:og_image),
          og_url: request.original_url,
          twitter_title: meta_tags.twitter_title,
          twitter_description: meta_tags.twitter_description,
          twitter_image: meta_tags.try(:twitter_image_upload) || meta_tags.try(:twitter_media),
          twitter_card_type: meta_tags.twitter_card_type
        }
      end
    end
  end
end
