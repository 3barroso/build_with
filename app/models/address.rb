class Address < ApplicationRecord

    enum :location_type, [:land, :property, :home, :appartment, :condominium, :retail, :commercial ]
end
