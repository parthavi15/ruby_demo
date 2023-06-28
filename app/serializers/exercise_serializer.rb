# frozen_string_literal: true

class ExerciseSerializer < ActiveModel::Serializer
  attributes :id
  attributes :name
  attributes :instruction
  attributes :thumb_image_url
end
