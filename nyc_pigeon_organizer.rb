def nyc_pigeon_organizer(data)
  new_hash = {}
  
  all_names = data.map do |types, hash|
    hash.values
  end
  all_names = all_names.flatten.uniq
  
  all_names.each do |name|
    new_hash[name] = {}
  end
  
  data.each do |type, hash|
    new_hash.each do |name, info|
      new_hash[name][type] = []
    end
  end
  
  data.each do |type, hash|
    new_hash.each do |names, kind|
      hash.each do |attribute, name|
        name.each do |the_name|
          if the_name == names
            new_hash[names][type] << attribute.to_s
          end
        end
      end
    end
  end
  
  new_hash
end