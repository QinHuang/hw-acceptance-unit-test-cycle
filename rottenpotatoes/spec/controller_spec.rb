require 'rails_helper'

RSpec.describe Movie, :type => :model do


    it "find movies with different director" do
        movies_d = [{id: 1,title: "The Seven Samurai",director: "Akira Kurosawa"},{id: 2,title: "Rashomon",director: "Akira Kurosawa"},{id: 3,title: "Pan's Labyrinth", director: "Guillermo del Toro"}, {id: 4, title:"Doctor Zhivago", director: "David Lean"}]

        movies_d.each do |item|
            Movie.create(item)
        end

        movies = Movie.enumerate_movies(3)
        expect(movies.pluck(:director)).not_to eq("Akira Kurosawa")
    end

    it "find movies with the same director" do
        movies_d = [{id: 1,title: "The Seven Samurai",director: "Akira Kurosawa"},{id: 2,title: "Rashomon",director: "Akira Kurosawa"},{id: 3,title: "Pan's Labyrinth", director: "Guillermo del Toro"}, {id: 4, title:"Doctor Zhivago", director: "David Lean"}]

        movies_d.each do |item|
            Movie.create(item)
        end

        movies = Movie.enumerate_movies(1)
        expect(movies.pluck(:director)).to eq(["Akira Kurosawa","Akira Kurosawa"])
    end

    it "find movies with the same director" do
        movies_d = [{id: 1,title: "The Seven Samurai",director: "Akira Kurosawa"},{id: 2,title: "Rashomon",director: "Akira Kurosawa"},{id: 3,title: "Pan's Labyrinth", director: "Guillermo del Toro"}, {id: 4, title:"Doctor Zhivago", director: "David Lean"}]

        movies_d.each do |item|
            Movie.create(item)
        end

        movies = Movie.enumerate_movies(4)
        expect(movies.pluck(:director)).to eq(["David Lean"])
    end

end 
