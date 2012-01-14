class Person < ActiveRecord::Base
has_many :hostings
has_many :shows, :through => :hostings
belongs_to :manager

def first_last_name
  return self.first_name + ' ' + self.last_name
end

def last_first_name
  return self.last_name + ', ' + self.first_name
end

validates :first_name, :presence => true
validates :last_name, :presence => true

def get_shows
  shows = Array.new
  self.shows.each do |show|
    shows.push show.title
  end
  return shows
end

def as_json(options={})
    { :name => self.first_last_name,
      :nickname => nickname,
      :bio => self.bio,
      :influences => self.influences,
      :major => self.major,
      :hometown => self.hometown,
      :class_year => self.class_year,
      :email => self.email,
      :shows => get_shows,
      :facebook => self.facebook_username,
      :twitter => self.twitter_username,
      :linkedin => self.linkedin_username,
      :website => self.website_url }
end

end
