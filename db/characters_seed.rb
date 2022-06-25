# frozen_string_literal: true

def characters_url(offset)
  "#{@base_url}characters?limit=100&offset=#{offset}&#{@authorization}"
end

number_of_characters = 1562
number_of_chars_left = 1562

i = 0
@count = 100

while i < number_of_characters
  characters = marvel_fetch(characters_url(i))
  @count = characters.count
  characters.each do |character|
    id = character['id']
    name = character['name']
    Character.create(name:, id:)
  end
  i += 100
end

puts "Generated #{Character.count} heros."
