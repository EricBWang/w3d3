# == Schema Information
#
# Table name: shortened_urls
#
#  id        :bigint           not null, primary key
#  short_url :string           not null
#  long_url  :string
#  user_id   :integer
#

class ShortenedURL < ApplicationRecord
  validates :long_url, presence: true

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User


  def self.random_code 
    temp = SecureRandom.urlsafe_base64
    while ShortenedURL.exists?(temp)
      temp = SecureRandom.urlsafe_base64
    end
    self.short_url = temp
  end

  

end
