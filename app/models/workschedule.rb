class Workschedule < ApplicationRecord
  belongs_to :user
  belongs_to :status
  default_scope -> {order(wdate: :asc)}
end
