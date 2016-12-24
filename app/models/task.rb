class Task < ActiveRecord::Base
  validates :title, presence: true
  validates :contents, presence: true
  validates :area, presence: true
  validates :deadline, presence: true
  validates :price, presence: true
  validates :status, presence: true
end
