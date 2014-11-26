class TransferSyntax < ActiveRecord::Base
  has_many :nodes

  validates :value, presence: true, uniqueness: true
  validates :name, presence: true
end
