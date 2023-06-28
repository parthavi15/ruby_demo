# frozen_string_literal: true

module V1
  class ExercisesController < ApiController
    before_action :set_exercise, only: :show

    def index
      @exercises = Exercise.with_attached_image.all
      json_response(@exercises) if stale?(@exercises)
    end

    def show
      json_response(@exercise) if stale?(@exercise)
    end

    private

    def set_exercise
      @exercise = Exercise.find_by(id: params[:id])
      not_found if @exercise.blank?
    end
  end
end
