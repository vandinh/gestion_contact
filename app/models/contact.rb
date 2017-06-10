class Contact < ApplicationRecord
    validates :firstname, :lastname, presence: true
    has_many :tags
end
