class Course < ApplicationRecord
  has_many :tutors
  accepts_nested_attributes_for :tutors
  validates :name, presence: true, uniqueness: true, length: { minimum: 3, message: "must be at least 3 characters long" }
end
