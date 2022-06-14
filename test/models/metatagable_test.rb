# frozen_string_literal: true

require "test_helper"

class MetatagableTest < ActiveSupport::TestCase
  class DefaultSettings < ActiveSupport::TestCase
    setup do
      @default_example = Example.new
    end

    test "class responds to settings" do
      assert @default_example.class.respond_to? :kubik_metatagable_settings
    end

    test "instance returns defaults setting" do
      assert @default_example.kubik_metatagable_default == false
    end

    test "instance returns default title setting" do
      assert @default_example.kubik_metatagable_title.nil?
    end

    test "instance returns default description setting" do
      assert @default_example.kubik_metatagable_description.nil?
    end
  end

  class OverridenDefault < ActiveSupport::TestCase
    setup do
      @example = OverridenExample.new({ dummy_title: "Test dummy_title",
                                        dummy_description: "Test dummy_description" })
    end

    test "class responds to settings" do
      assert @example.class.respond_to? :kubik_metatagable_settings
    end

    test "instance returns defaults setting" do
      assert @example.kubik_metatagable_default == true
    end

    test "instance returns default title after save" do
      @example.save

      assert @example.kubik_metatagable_title == "Test dummy_title"
      assert @example.meta_tag.title_tag == "Test dummy_title"
    end

    test "instance returns same title_tag after resave default title " do
      @example.save
      @example.update_attribute(:dummy_title, "New test")

      assert @example.meta_tag.title_tag == "Test dummy_title"
    end

    test "instance returns default description after save" do
      @example.save

      assert @example.kubik_metatagable_description == "Test dummy_description"
      assert @example.meta_tag.meta_description == "Test dummy_description"
    end

    test "instance returns same meta_description after resave default title " do
      @example.save
      @example.update_attribute(:dummy_description, "New test")

      assert @example.meta_tag.meta_description == "Test dummy_description"
    end
  end
end
