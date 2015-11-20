class Task < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }

  belongs_to :user

  def as_json(options={})
    super(:only => [
      :id,
      :name,
      :note,
      :state,
      :occured_at,
      :created_at,
      :updated_at
    ])
  end
end
