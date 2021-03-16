require 'rails_helper'


describe MoviesController, :type => :request do
    
    context "given with movie with no director" do
        it " Should route to the default movies page" do
        movies_d = [{id: 1,title: "The Seven Samurai",director: ""},{id: 2,title: "Rashomon",director: "Akira Kurosawa"},{id: 3,title: "Pan's Labyrinth", director: "Guillermo del Toro"}, {id: 4, title:"Doctor Zhivago", director: "David Lean"}]

        movies_d.each do |item|
            Movie.create(item)
        end
            
            get ("/movies/"+"1"+"/same_director")
            expect(response).to redirect_to('/movies') 
        end 
    end 
    
    context "given similar movies" do
        it "Should route to homo_movie webpage with similar movies" do

        movies_d = [{id: 1,title: "The Seven Samurai",director: "Akira Kurosawa"},{id: 2,title: "Rashomon",director: "Akira Kurosawa"},{id: 3,title: "Pan's Labyrinth", director: "Guillermo del Toro"}, {id: 4, title:"Doctor Zhivago", director: "David Lean"}]

        movies_d.each do |item|
            Movie.create(item)
        end
            movie_id =  Movie.find_by(title: "The Seven Samurai").id.to_s
            get ("/movies/"+movie_id+"/same_director")
            expect(response).to render_template("homo_director") 
        end
    end

    context "given similar movies" do
        it "Should route to homo_movie webpage with similar movies" do

        movies_d = [{id: 1,title: "The Seven Samurai",director: "Akira Kurosawa"},{id: 2,title: "Rashomon",director: "Akira Kurosawa"},{id: 3,title: "Pan's Labyrinth", director: "Guillermo del Toro"}, {id: 4, title:"Doctor Zhivago", director: "David Lean"}]

        movies_d.each do |item|
            Movie.create(item)
        end
            movie_id =  Movie.find_by(title: "Rashomon").id.to_s
            get ("/movies/"+movie_id+"/same_director")
            expect(response).to render_template("homo_director") 
        end
    end

    context "Start from homepage" do
        
        it " Should route properly based on the API calls " do
            movies_list = [{id: 1,title: "Rashomon",director: "Akira Kurosawa", release_date: "1951-12-26"}]
            movies_list.each do |movie|
                Movie.create(movie)
            end
            
            put "/movies/1", "movie": {"title": "The Seven Samurai"}
            expect(response).to redirect_to("/movies/1")
            get "/movies/1/edit"
            expect(response).to render_template("edit")
            get "/movies"
            expect(response).to render_template("index");
            get ("/movies/"+"1"+"/same_director")
            expect(response).to render_template("homo_director") 
            delete ("/movies/1")
            expect(response).to redirect_to("/movies")
            
            end
        end

end 
