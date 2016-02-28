class Style < ActiveRecord::Base

  has_many :beers, dependent: :destroy

  def self.top(n)
    styles = Style.all

    avgs = styles.map do |s|
      beers = s.beers
      beers_avg = beers.map{|b| (b.average_rating||0)}

      average = beers_avg.sum.to_f / beers_avg.size.to_f
      {s => average}
    end

    avgs = avgs.sort_by {|k,v| v}

    avgs.take(n)

  end

end
