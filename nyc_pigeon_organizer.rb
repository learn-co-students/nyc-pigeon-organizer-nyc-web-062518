require "pry"

def nyc_pigeon_organizer(data)
  names = data.map do |attribute, details_hash|
    details_hash.values
  end
  seven_pigeons = names.flatten.uniq
  organized_hash = {}
  seven_pigeons.each do |name|
    organized_hash[name] = {}
  end
  data.each do |attribute, details_hash|
    organized_hash.each do |quality, data|
      organized_hash[quality][attribute] = []
    end
  end
  data.each do |attribute, details_hash|
    organized_hash.each do |quality, data|
      details_hash.each do |key, value|
        if value.include? quality
          organized_hash[quality][attribute] << key.to_s
        end
      end
    end
  end
  organized_hash
end
