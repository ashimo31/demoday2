class Task < ActiveRecord::Base
       belongs_to :user
       belongs_to :area
       has_many :messages, dependent: :destroy
       enum status: {探しています:0, 提供できます:1, その他:2}

       mount_uploader :image, AvatarUploader

       scope :get_by_title, ->(title) {where("title like ?", "%#{title}%")}

       scope :get_by_status, ->(status) {where(status: status)}

end
