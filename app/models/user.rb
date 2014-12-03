class User < ActiveRecord::Base
  has_many :nodes, dependent: :destroy

  before_create :generate_api_key

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def generate_api_key
    unless api_key.present?
      begin
        self.api_key = SecureRandom.hex
      end while self.class.exists?(api_key: api_key)
    end
  end
end
