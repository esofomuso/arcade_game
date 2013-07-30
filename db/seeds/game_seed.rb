require 'csv'

field_fetchers = {}
CSV.open(File.join(Rails.root, 'db', 'seeds/games.csv'), "r", :headers => true) do |csv|
  csv.each do |attributes|
    attributes = attributes.to_hash
    attributes.each do |key, value|
      fetcher = field_fetchers[key.to_sym]
      val = if fetcher
        result = fetcher.call(value)
        result
      else
        value
      end
      attributes[key] = val
    end
    
    begin
#      p = attributes.map{|k,v| if k == "is_active" then if v == "1" then [k.to_sym, "t"] else [k.to_sym, "f"] end else [k.to_sym,v] end }
#      record = ArcadeGame.where(Hash[*p.flatten])
      param = attributes.map{|k,v| if k == "is_active" then if v == "1" then "t" else "f" end else v end}
      record = ArcadeGame.find_by_name_and_year_and_manufacturer_and_notes_and_is_active *param
      if record.blank?
        record = ArcadeGame.new
        attributes.each do |key, value|
          record.send("#{key}=", value)
        end
        record.save!
      end
    rescue
      puts $!
    end
  end
end 