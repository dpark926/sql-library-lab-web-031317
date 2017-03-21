# authors:          id, name
# subgenres:        id, name
# series:           id, title,                author_id, subgenre_id
# books:            id, title, year,          series_id, author_id
# characters:       id, name, species, motto, series_id, author_id
# character_books:  id,                       book_id, character_id

def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year
  FROM series
  INNER JOIN books
  ON books.series_id = series.id
  WHERE books.series_id = 1
  ORDER BY books.year;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, MIN(motto)
  FROM characters;"
end

def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT (species)
  FROM characters
  GROUP BY species
  ORDER BY species DESC LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
  FROM series
  INNER JOIN authors
  ON series.author_id = authors.id
  INNER JOIN subgenres
  ON series.subgenre_id = subgenres.id;"
end

def select_series_title_with_most_human_characters
  "SELECT series.title
  FROM series
  INNER JOIN characters
  ON series.id = characters.series_id
  GROUP BY characters.species
  ORDER BY COUNT(characters.species) LIMIT 1;" #id
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(books.id) AS book_count
  FROM character_books
  INNER JOIN books
  ON character_books.book_id = books.id
  INNER JOIN characters
  ON character_books.character_id = characters.id
  GROUP BY characters.name
  ORDER BY book_count DESC;"
end
