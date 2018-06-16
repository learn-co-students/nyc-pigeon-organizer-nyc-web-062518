require "pry"
def nyc_pigeon_organizer(data)
data.each_with_object({}) do |(key, hash), pigeon_list|
  hash.each do |attribute, pigeon_array|
    pigeon_array.each do |pigeon|
      pigeon_list[pigeon] ||= {}
      pigeon_list[pigeon][key] ||= []
      pigeon_list[pigeon][key] << attribute.to_s
      #binding.pry
    end

  end

end

end
