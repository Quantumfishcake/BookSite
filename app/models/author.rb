# == Schema Information
#
# Table name: authors
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  image       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

class Author < ApplicationRecord
  has_many :books
  has_many :groups, through: :books
end
