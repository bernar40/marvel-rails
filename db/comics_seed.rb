# frozen_string_literal: true

def comics_url(offset)
  "#{@base_url}comics?orderBy=-onsaleDate&&limit=100&offset=#{offset}&#{@authorization}"
end

# for a quicker verification, lower this number -> Marvel has 52K available comics
# Recommended: 1000
number_of_comics = 10_000

i = 0
@count = 100

while i < number_of_comics
  comics = marvel_fetch(comics_url(i))

  @count = comics.count
  comics.each do |comic|
    id = comic['id']
    title = comic['title']
    description = comic['description']
    on_sale_date = comic['dates'].select { |d| d['type'] == 'onsaleDate' }.first['date']
    page_count = comic['pageCount']
    thumbnail_path = comic['thumbnail']['path']
    thumbnail_extension = comic['thumbnail']['extension']

    next if Comic.find_by_id(id)

    Comic.create(id:, title:, description:, on_sale_date:,
                 page_count:, thumbnail_path:, thumbnail_extension:)

    next if comic['characters']['available'].zero?

    comic['characters']['items'].each do |character|
      character_name = character['name']
      CharacterComic.create(character_name:, comic_id: id)
    end
  end
  i += 100
  puts "Generated #{i} out of #{number_of_comics} comics." if (i % 1000).zero?
end

puts "Generated #{Comic.count} comics."
