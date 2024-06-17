# frozen_string_literal: true

class Profile < ApplicationRecord
  extend FriendlyId
  friendly_id :full_name, use: :slugged
  def full_name
    "#{first_name}-#{last_name}"
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      find_each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end
end
