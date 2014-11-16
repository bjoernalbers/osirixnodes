class Node < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :port, presence: true
  validates :aetitle, presence: true
end
