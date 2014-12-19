class User < ActiveRecord::Base
  MAX_USERS = 100

  has_many :nodes, dependent: :destroy

  before_create :generate_api_key
  after_commit :create_sample_node, :on => :create #TODO: Test this!

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.left_beta_accounts
    registered_beta_accounts = User.count
    if registered_beta_accounts < MAX_USERS
      MAX_USERS - registered_beta_accounts
    else
      0
    end
  end

  private

  def email_required?
    !guest?
  end

  def password_required?
    !guest? && super
  end

  def confirmation_required?
    !guest? && super
  end

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
