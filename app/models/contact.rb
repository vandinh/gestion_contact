class Contact < ApplicationRecord
	validates :firstname, :lastname, presence: true
	has_many :tags, dependent: :destroy
	mount_uploader :photo, PhotoUploader

  def self.search(search)
	  if search
	    joins(:tags).where("tags.name LIKE ?", "%#{search}%")
	  else
	    find(:all)
		end
	end
end
