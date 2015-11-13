class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :async

  before_save :downcase_email

  validates :email, presence: true, length: { maximum: 255 }
  validates :encrypted_password, length: { minimum: 6 }, allow_blank: true

  private
    # Converts email to all lower-case
    def downcase_email
      self.email.downcase!
    end
end
