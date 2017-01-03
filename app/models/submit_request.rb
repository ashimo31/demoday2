class SubmitRequest < ActiveRecord::Base

  #before_action :authenticate_user!

  belongs_to :user
  belongs_to :work
  belongs_to :request_user, class_name: 'User', foreign_key: 'request_user_id'

  validates :user_id, :task_id, :request_user_id, presence: true
  validate :no_repeated_request, on: :create

  private

   def no_repeated_request
     submit_request = SubmitRequest.where(work_id: work_id, status: 1)
     errors.add(:base, "このタスクは既に依頼をだしています。") unless submit_request.blank?
   end
end
