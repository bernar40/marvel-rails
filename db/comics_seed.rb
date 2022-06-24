# frozen_string_literal: true

def comics_url(offset)
  "#{@base_url}comics?orderBy=-onsaleDate&limit=100&offset=#{offset}&#{@authorization}"
end

number_of_comics = 1000 # There are about 46,000 comics available in the Marvel API
i = 0
@count = 100
# while @count == 100
while i < number_of_comics
  comics = marvel_fetch(comics_url(i))

  @count = comics.count
  comics.each do |comic|
    id = comic['id']
    title = comic['title']
    description = comic['description']
    pages = comic['pageCount']
    thumbnail_path = comic['thumbnail']['path']
    thumbnail_extension = comic['thumbnail']['extension']
    id_comic = Comic.find_by_id(id)
    unless id_comic
      Comic.create(id:, title:, description:, page_count: pages, thumbnail_path:,
                   thumbnail_extension:)
    end
  end
  i += 100
end

puts "Generated #{Comic.count} comics."
