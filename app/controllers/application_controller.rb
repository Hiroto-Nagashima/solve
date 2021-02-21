class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :current_todays_scoring,if: :user_signed_in?


# def current_todays_scoring
#   current_todays_score_box = []
#   @current_todays_scores = current_user.scores.where(created_at: Time.zone.now.all_day)
#   @current_todays_scores.each do |current_todays_score|
#     current_todays_score_box << current_todays_score.score
#   end
#   @current_todays_score = current_todays_score_box.inject(:+)
# end

  def after_sign_in_path_for(resource)
    users_path
  end

  def after_sign_up_path_for(resource)
    users_path
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
