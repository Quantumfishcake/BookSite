# == Schema Information
#
# Table name: books
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  description :text
#  author      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :author
end
