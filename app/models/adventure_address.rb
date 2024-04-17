# frozen_string_literal: true

# Join table
class AdventureAddress < ApplicationRecord
  belongs_to :address
  belongs_to :adventure

  accepts_nested_attributes_for :address
end
