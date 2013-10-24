require 'spec_helper'

describe Movie do
  describe "with a director" do
    before(:each) do
      @mv1 = Movie.create!(:title => "Title", :rating => "Rating", :director => "Ben")
      @mv2 = Movie.create!(:title => "Title", :rating => "Rating", :director => "Ben")
      @mv3 = Movie.create!(:title => "Title", :rating => "Rating", :director => "Ben")
      @mv4 = Movie.create!(:title => "Title", :rating => "Rating", :director => "Steph")
    end
    
    it "should contain all movies" do
      Movie.all.should include @mv1
      Movie.all.should include @mv2
      Movie.all.should include @mv3
      Movie.all.should include @mv4
    end
    
    describe "if similar movies exist" do
      it "should find all similar movies" do
        result = Movie.find_similar_movies(@mv3)
        result.should include @mv1
        result.should include @mv2
        result.should_not include @mv3
        result.should_not include @mv4
      end
    end
    
    describe "if no similar movies exist" do
      it "should not find any similar movies" do
        result = Movie.find_similar_movies(@mv4)
        result.should be_empty
        
      end
    end
  end
end