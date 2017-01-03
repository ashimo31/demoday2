class Task < ActiveRecord::Base

       belongs_to :user, dependent: :destroy

       has_many :messages, dependent: :destroy

       enum status: {未着手:0, 対応中:1, 完了:2}

end
