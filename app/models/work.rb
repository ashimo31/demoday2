class Work < ActiveRecord::Base
  has_many :submit_requests, dependent: :destroy

  belongs_to :user
  belongs_to :charge, class_name: 'User', foreign_key: 'charge_id'

  validates :title, presence: true

  enum status: {まだ反応なし:0, ご相談中:1, 完了:2}

end
