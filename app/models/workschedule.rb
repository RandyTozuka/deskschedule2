class Workschedule < ApplicationRecord
  belongs_to :user
  belongs_to :status
end
