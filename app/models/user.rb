class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :async

  before_save :downcase_email

  validates :email, presence: true, length: { maximum: 255 }
  validates :encrypted_password, length: { minimum: 6 }, allow_blank: true

  belongs_to :profile, touch: true
  belongs_to :company

  delegate :full_name, to: :profile

  # def full_name
  #   self.profile.full_name.upcase
  # end

  private
    # Converts email to all lower-case
    def downcase_email
      self.email.downcase!
    end
end
