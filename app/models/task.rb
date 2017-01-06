class Task < ActiveRecord::Base
       belongs_to :user
       belongs_to :area, class_name: 'Area', foreign_key: 'area_id'
       has_many :messages, dependent: :destroy
       enum status: {探しています:0, 提供できます:1, その他:2}

       mount_uploader :image, AvatarUploader
end
