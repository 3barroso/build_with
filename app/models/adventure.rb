# frozen_string_literal: true

# Representing tracking of work (pictures, descriptions, tags, details)
class Adventure < ApplicationRecord
  enum status: { draft: 0, bid: 1, in_progress: 5, complete: 10 }
  enum shareable: { everyone: 0, followers: 3, party: 6, company_owners: 9, adventure_leaders: 15 }

  has_many :adventure_addresses
  has_many :addresses, through: :adventure_addresses
  accepts_nested_attributes_for :adventure_addresses

  # make its own model adventureImages so it can have descriptions / tags / interactions?
  has_many_attached :images do |attachable|
    attachable.variant :mobile, resize_to_limit: [200, 100]
  end

  before_validation :find_or_create_addresses

  def find_or_create_addresses
    adventure_addresses.each do |adventure_address|
      address_params = adventure_address.address
      adventure_address.address = Address.find_or_create_by(
        street_number: address_params.street_number,
        street: address_params.street,
        city: address_params.city,
        state: address_params.state
      )
    end
  end
end
