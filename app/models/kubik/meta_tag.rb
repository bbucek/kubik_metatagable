# frozen_string_literal: true

module Kubik
  # MetaTag class
  class MetaTag < ApplicationRecord
    self.table_name = "kubik_meta_tags"
    include Kubik::Uploadable

    belongs_to :metatagable, polymorphic: true

    TWITTER_CARD_TYPES = %i[summary summary_large_image player].freeze

    has_one_kubik_upload(
      self, :og_image_upload
    )
    has_one_kubik_upload(
      self, :twitter_image_upload
    )
  end
end
