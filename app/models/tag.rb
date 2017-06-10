class Tag < ApplicationRecord
  validates :name, :contact_id, presence: true
  belongs_to :contact
end
