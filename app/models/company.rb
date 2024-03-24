# frozen_string_literal: true

# Represents work group
class Company < ApplicationRecord
  has_one_attached :logo do |attachable|
    attachable.variant :banner, resize_to_limit: [200, 400]
  end
end
