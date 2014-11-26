class Node < ActiveRecord::Base
  belongs_to :user
  belongs_to :transfer_syntax

  validates :user, presence: true
  validates :name, presence: true
  validates :aetitle, presence: true
  validates :address, presence: true
  validates :port, presence: true
  validates :transfer_syntax, presence: true
end
