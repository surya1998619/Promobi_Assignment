class Tutor < ApplicationRecord
  belongs_to :course
  validates :name, presence: true, uniqueness: true, length: { minimum: 3, message: "must be at least 3 characters long" }
end
