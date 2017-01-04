class Task < ActiveRecord::Base
       belongs_to :user
       belongs_to :area, class_name: 'Area', foreign_key: 'area_id'
       has_many :messages, dependent: :destroy
       enum status: {未着手:0, 対応中:1, 完了:2}
end
