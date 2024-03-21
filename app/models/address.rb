# frozen_string_literal: true

# Object storing locations
class Address < ApplicationRecord

    enum :location_type, [:land, :property, :home, :appartment, :condominium, :retail, :commercial ]

    attr_accessor :county
end
