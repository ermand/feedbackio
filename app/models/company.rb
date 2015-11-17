class Company < ActiveRecord::Base
  has_paper_trail

  validates :name, presence: true, length: { maximum: 30 },
      uniqueness: { case_sensitive: false }
end
