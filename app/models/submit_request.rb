class SubmitRequest < ActiveRecord::Base

  belongs_to :user
  belongs_to :work
  belongs_to :request_user, class_name: 'User', foreign_key: 'request_user_id'
  belongs_to :charger, class_name: 'User', foreign_key: 'charge_id'

  validates :user_id, :work_id, :request_user_id, presence: true
  validate :no_repeated_request, on: :create

  enum status: {依頼中:1, 承認済:2, 依頼を却下:9}

  private

   def no_repeated_request
     submit_request = SubmitRequest.where(work_id: work_id, status: 1)
     errors.add(:base, "このタスクは既に依頼をだしています。") unless submit_request.blank?
   end
end
