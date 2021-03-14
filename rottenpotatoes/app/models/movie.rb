class Movie < ActiveRecord::Base
    def self.enumerate_movies(movie)
      return self.where(director: self.find(movie).director).all
    end
    
end
