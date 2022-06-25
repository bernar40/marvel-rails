# frozen_string_literal: true

def characters_url(offset, character_id)
  "#{@base_url}characters/#{character_id}/comics?limit=100&offset=#{offset}&#{@authorization}"
end

Character.all.each_with_index do |character, i|
  comics = marvel_fetch(characters_url(i, character.id))
  comics.each do |comic|
    id = comic['id']
    comic_result = Comic.find_by_id(id)
    CharacterComic.create(character:, comic: comic_result) if comic_result
  end
end

puts "Generated #{CharacterComic.count} links between heros and comics."
