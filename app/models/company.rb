# frozen_string_literal: true

# Represents work group
class Company < ApplicationRecord
  has_one_attached :logo do |attachable|
    attachable.variant :banner, resize_to_limit: [200, 400]
  end

  validates :slug, presence: true, uniqueness: true

  before_validation :prep_company_save

  def prep_company_save
    slug.downcase!
  end
end
