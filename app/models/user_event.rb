class UserEvent < ActiveRecord::Base

validate :check_presence_of_start_end_and_duration
# validates :start_date, format: { with: /\A\d{4}-\d{2}-\d{2}\z/ }, allow_nil: true
belongs_to :user


	def check_presence_of_start_end_and_duration			
		  if start_date.present? && end_date.present? && duration.present?
		      no_of_days = (start_date..end_date).count
		      errors.add(:duration, "no of duration days is incorrect") if no_of_days != duration
		  elsif start_date.present? && !end_date.present? && !duration.present?
		      errors.add(:base, "either end date or duration should be present")
		  elsif !start_date.present? && end_date.present? && !duration.present?
		      errors.add(:base, "either end date or duration should be present")
		  elsif !start_date.present? && !end_date.present? && duration.present?
		      errors.add(:base, "either end date or duration should be present")
		  else
		      errors.add(:base, "please enter any two out of start date, end date and duration")
		  end
	end

	def self.field_values_calculation(params)
		if !params[:user_event][:start_date].present?
        params[:user_event][:start_date] = params[:user_event][:end_date].to_date - params[:user_event][:duration].to_i+1
      elsif !params[:user_event][:end_date].present?
        params[:user_event][:end_date] = params[:user_event][:start_date].to_date + params[:user_event][:duration].to_i-1
      elsif !params[:user_event][:duration].present?
        params[:user_event][:duration] = (params[:user_event][:start_date].to_date..params[:user_event][:end_date].to_date).count
      else
        params
      end
	end

end
