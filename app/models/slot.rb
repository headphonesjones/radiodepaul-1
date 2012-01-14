class Slot < ActiveRecord::Base
  has_one :scheduling
  has_one :show, :through => :scheduling
  
  def quarter_start_time_end_time
    return self.quarter + ' between ' + self.start_time.strftime("%I:%M%p %Z") + ' and ' + self.end_time.strftime("%I:%M%p %Z")
  end
  
  def get_days_airing
    days_airing = Array.new
      if self.monday == true
        days_airing.push "monday"
      end
      if self.tuesday == true
        days_airing.push "tuesday"
      end
      if self.wednesday == true
        days_airing.push "wednesday"
      end
      if self.thursday == true
        days_airing.push "thursday"
      end
      if self.friday == true
        days_airing.push "friday"
      end
      if self.saturday == true
        days_airing.push "saturday"
      end
      if self.sunday == true
        days_airing.push "sunday"
      end
    return days_airing
  end
  
  def get_hosts 
    hosts = Array.new
    self.show.people.each do |person|
      hosts.push person.first_last_name
    end
    return hosts
  end
  
  
  def as_json(options={})
      {:quarter => self.quarter,
       :days  => get_days_airing,
       :start_time => self.start_time,
       :end_time => self.end_time,
       :show => self.show.title,
       :hosts => get_hosts,
       :genre => self.show.genre,
       :short_description => self.show.short_description }
  end
  
end
