class Review < ApplicationRecord
  belongs_to :user

  belongs_to :shop, optional: true
  has_many :review_budgets, dependent: :destroy
  has_many :budgets, through: :review_budgets

  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user


  mount_uploader :pic1, ImageUploader
  mount_uploader :pic2, ImageUploader
  mount_uploader :pic3, ImageUploader
  mount_uploader :pic4, ImageUploader
  mount_uploader :pic5, ImageUploader

  def dinner_rate_average
    Review.where(lunch_dinner: 1).average(:rate)
  end

  def lunch_rate_average
    Review.where(lunch_dinner: 2).average(:rate)
  end

  def start_time
    self.visit_day
    ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end
