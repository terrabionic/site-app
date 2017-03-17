class Notification < ActiveRecord::Base
  belongs_to :event, class_name: 'EventMonitor'
  belongs_to :notice
  belongs_to :user

  validates :title, presence: true
  validates :user, presence: true

end
