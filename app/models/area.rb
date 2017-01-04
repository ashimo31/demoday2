class Area < ActiveRecord::Base
  has_many :task, dependent: :destroy
end
