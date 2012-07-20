class Url < ActiveRecord::Base
  attr_accessible :long_url, :short_url_slug
  # verifies that long url and short url slug are unique before saving to the databe
  validates_uniqueness_of :long_url
  # verifies not null
  validates_presence_of :long_url

  before_save :set_short_slug

  def set_short_slug
    self.short_url_slug ||= random_string
  end

  def random_string
    string = (0...6).map{97.+(rand(25)).chr}.join
    if Url.find_by_short_url_slug(string) == nil
      return string
    else
      random_string
    end
  end
end





