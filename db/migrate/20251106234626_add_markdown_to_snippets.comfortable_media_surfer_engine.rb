# frozen_string_literal: true

# This migration comes from comfortable_media_surfer_engine (originally 2)
# null: false added by rubocop, not in original migration
class AddMarkdownToSnippets < ActiveRecord::Migration[7.1]
  def change
    add_column :comfy_cms_snippets, :markdown, :boolean, default: false, null: false
  end
end
