class Company < ActiveRecord::Base
  has_paper_trail

  validates :name, presence: true, length: { maximum: 30 },
      uniqueness: { case_sensitive: false }
  validates :state, presence: true, length: { maximum: 30 }

  state_machine :initial => :new do
    event :activate do
      transition all - :active => :active
    end
  end
end
