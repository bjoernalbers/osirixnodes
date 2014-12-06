class User < ActiveRecord::Base
  has_many :nodes, dependent: :destroy

  before_create :generate_api_key
  after_commit :create_sample_node, :on => :create #TODO: Test this!

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

  def create_sample_node
    self.nodes.create! name: 'Your wonderful example node',
      aetitle: 'HELLO',
      address: '127.0.0.1',
      port: 11112
  end
end
