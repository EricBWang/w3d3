# == Schema Information
#
# Table name: users
#
#  id    :bigint           not null, primary key
#  email :text             not null
#

class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true 

  has_many :urls, 
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ShortenedURL
end
