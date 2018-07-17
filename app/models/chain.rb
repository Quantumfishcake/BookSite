# == Schema Information
#
# Table name: chains
#
#  id         :bigint(8)        not null, primary key
#  name       :text
#  numbooks   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Chain < ApplicationRecord
  has_many :books
  has_many :authors, through: :books
end
