def nyc_pigeon_organizer(data)
  # write your code here!

  # Identfies & Stores Unique Pigeon Names
  pigeonNames = []
  uniquePigeonNames = []

  data.each do |attributeCategories, attributeHash|
    attributeHash.each do |attribute, nameArray|
      pigeonNames.push(nameArray)
    end
  end
  uniquePigeonNames = (pigeonNames.flatten).uniq

  # Groups Together Attributes into a Multidimensional Array in Accordance to Unique Pigeon Names
  categories = []
  attributesArray = []
  nameArrays =[]
  multiDimensionalArray = Array.new(uniquePigeonNames.length){Array.new(0)}
  groupOfProfiles = {}

  (uniquePigeonNames.length).times do |counter|
    data.each do |attributeCategory, attributeHash|
      categories.push(attributeCategory)
      attributeHash.each do |attribute, nameArray|
        attributesArray.push(attribute)
        nameArrays.push(nameArray)
        nameArray.each do |name|
          if name == uniquePigeonNames[counter]
            multiDimensionalArray[counter].push({attributeCategory => [attribute.to_s]})
          end
          groupOfProfiles[uniquePigeonNames[counter]] = multiDimensionalArray[counter]
        end
      end
    end
  end

  # Merging Attributes
  attributeArray = []
  mergedAttributes = []
  valuesOfIdenticalKeys = []

  7.times do |counter1|
    if (multiDimensionalArray[counter1]).length == 3
      mergedAttributes.push(((multiDimensionalArray[counter1][0]).merge(multiDimensionalArray[counter1][1])).merge(multiDimensionalArray[counter1][2]))
    else
      2.times do |counter2|
        value = (multiDimensionalArray[counter1][counter2]).values
        valuesOfIdenticalKeys.push(value)
      end
      key = ((multiDimensionalArray[counter1][0]).keys)
      attributeArray.push(key[0] => valuesOfIdenticalKeys.flatten)
      mergedAttributes.push(((attributeArray[0]).merge(multiDimensionalArray[counter1][2])).merge(multiDimensionalArray[counter1][3]))
      valuesOfIdenticalKeys.pop()
      valuesOfIdenticalKeys.pop()
      attributeArray.pop()
      key.pop()
    end
  end

  # Assiging Attributes
  pigeon_list = {}

  (uniquePigeonNames.length).times do |counter|
    pigeon_list[uniquePigeonNames[counter]] = mergedAttributes[counter]
  end
  return pigeon_list

end
