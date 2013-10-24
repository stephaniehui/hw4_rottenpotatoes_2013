require 'spec_helper'

describe MoviesController do
  describe "GET 'similar'" do
    before(:each) do
      @fake_results = [mock('movie1'), mock('movie2')]
      @movie = Movie.create!(:title => "Title", :rating => "Rating", :director => "Director", :release_date => Time.now)
    end
    
    it "should call the model method that finds similar movies" do
      Movie.should_receive(:find_similar_movies).with(@movie)
      get :similar, :id => @movie.id
    end
    
    describe "with a valid director" do
      before(:each) do
        Movie.stub(:find_similar_movies).and_return(@fake_results)
        get :similar, :id => @movie.id
      end
      
      it "should render the correct template" do
        response.should render_template('similar')
      end
      
      it "should make results available to the template" do
        assigns(:similar).should == @fake_results
      end
    end
  end
end