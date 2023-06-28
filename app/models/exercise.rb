class Exercise < ApplicationRecord
	has_one_attached :image, dependent: :destroy do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, nil]
  end

	validates :name, :image, presence: true

	def thumb_image_url
		Rails.application.routes.url_helpers.rails_representation_url(image.variant(:thumb).processed, disposition: 'attachment') if image.attached?
  end
end
