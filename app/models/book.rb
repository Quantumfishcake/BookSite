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
#  user_id     :integer
#  category_id :integer
#  author_id   :integer
#  genre_id    :integer
#  group_id    :integer
#  chain_id    :integer
#

class Book < ApplicationRecord
  belongs_to :user, :optional => true
  belongs_to :group, :optional => true
  belongs_to :author, :optional => true
  belongs_to :chain, :optional => true
  has_many :subjects, :dependent => :nullify
  has_many :lists, through: :subjects

end
