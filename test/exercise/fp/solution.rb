module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered_films = array.select do |film|
          !film['country'].nil? &&
            film['country'].split(',').count > 1 &&
            film['rating_kinopoisk'].to_f.positive?
        end
        filtered_films.inject(0.0) { |sum, film| sum + film['rating_kinopoisk'].to_f } / filtered_films.count
      end

      def chars_count(films, threshold)
        films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
             .inject(0) { |sum, film| sum + film['name'].count('и') }
      end
    end
  end
end
