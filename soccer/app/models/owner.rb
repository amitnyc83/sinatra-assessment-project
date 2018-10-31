class Owner < ActiveRecord::Base
  has_many :teams
  has_many :players, through: :teams
  has_secure_password


  def slug
    self.username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.find do |user|
      user.slug == slug
    end
  end 

end
