class Company < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 30 },
      uniqueness: { case_sensitive: false }
  validates :state, presence: true, length: { maximum: 30 }
end
