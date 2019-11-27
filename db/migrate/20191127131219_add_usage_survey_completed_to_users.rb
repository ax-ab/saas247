class AddUsageSurveyCompletedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :usage_survey_completed, :date
  end
end
