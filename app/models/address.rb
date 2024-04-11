# frozen_string_literal: true

# add comments of table varialbes (because structure sql vs schema.rb readability) (automate / gem /rubocop?)

# Object storing locations
class Address < ApplicationRecord
  has_many :adventure_addresses
  has_many :adventures, through: :adventure_addresses

  enum location_type: { land: 0, property: 1, home: 2, appartment: 3, condominium: 4, retail: 5, commercial: 6 }

  attr_accessor :county

  validates :street_number, :street, :city, :state, presence: true
  validates_uniqueness_of :street_number, scope: %i[street city state] # on create?
  # updated calls should find_or_create addresss

  # add `apt_no` option? (string ex 1A, 3C )
end
