class List < ApplicationRecord
  has_many :subjects, :dependent => :nullify
  has_many :books, through: :subjects
  belongs_to :user, :optional => true
end
