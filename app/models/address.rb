# frozen_string_literal: true

# Object storing locations
class Address < ApplicationRecord
  enum location_type: { land: 0, property: 1, home: 2, appartment: 3, condominium: 4, retail: 5, commercial: 6 }

  attr_accessor :county

  validates :street_number, :street, :city, :state, presence: true
  validates_uniqueness_of :street, scope: %i[street_number city state] # on create?
  # updated calls should find_or_create addresss
end
