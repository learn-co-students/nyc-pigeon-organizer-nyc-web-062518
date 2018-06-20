
def nyc_pigeon_organizer(data)
  # write your code here!
  pigeon_list = {}
  data.each do |attribute, choice_hash|
    choice_hash.each do |choice, names_array|
      names_array.each do |name|
        if pigeon_list[name] == nil
          pigeon_list[name] = {}
        end  
        if pigeon_list[name][attribute] == nil
          pigeon_list[name][attribute] = []
        end  
        pigeon_list[name][attribute] << choice.to_s
      end
    end  
  end
  pigeon_list
end


=begin
def nyc_pigeon_organizer(data)
  data.each_with_object({}) do |(key, h), result|
    h.each do |value, names|
      names.each do |name|
        result[name] ||= {}
        result[name][key] ||= []
        result[name][key] << value.to_s
      end
    end
  end
end
=end