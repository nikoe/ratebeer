class MoveBeerStylesToOwnTable < ActiveRecord::Migration
  def change
    styles = Beer.uniq.pluck(:style_old)
    styles.each do |s|
      Style.create name:s
    end

    beers = Beer.all

    beers.each do |beer|
      style_name = beer.style_old
      style = Style.find_by name:style_name

      if not style.nil?
        beer.style_id = style.id
        beer.save
      end
    end
  end
end
