class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :async,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  before_save :downcase_email

  validates :email, presence: true, length: { maximum: 255 }
  validates :encrypted_password, length: { minimum: 6 }, allow_blank: true

  belongs_to :profile, touch: true
  belongs_to :company
  has_many :tasks

  delegate :full_name, to: :profile

  # def full_name
  #   self.profile.full_name.upcase
  # end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    # Uncomment the section below if you want users to be created if they don't exist
    # unless user
    #     user = User.create(name: data["name"],
    #        email: data["email"],
    #        password: Devise.friendly_token[0,20]
    #     )
    # end
    user
  end

  private
    # Converts email to all lower-case
    def downcase_email
      self.email.downcase!
    end
end
