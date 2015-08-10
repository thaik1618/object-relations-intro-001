require_relative 'spec_helper'
require_relative '../lib/person.rb'

context "Person" do 
  
    let(:beyonce) {Person.new("Beyonce")}
    let(:jayz) {Person.new("Jay-Z")}
    let(:meek) {Person.new("Meek Mill")}
  describe "Code Along I" do 
    
    describe "#new" do 
      it "initializes with a name and a happiness level of 5" do 
        expect(beyonce.name).to eq("Beyonce")
        expect(beyonce.happiness).to eq(5)
      end
    end

    describe "#go_on_a_date" do 
      it "decreases the happiness level of both people if they are not a match" do 
        beyonce.go_on_a_date(meek, false)
        expect(beyonce.happiness).to eq(4)
        expect(meek.happiness).to eq(4)
      end

      it "increases the happiness level of both people if they are a match" do 
        beyonce.go_on_a_date(jayz, true)
        expect(beyonce.happiness).to eq(6)
        expect(jayz.happiness).to eq(6)
      end
    end
  end

  describe "Code Along II" do 
    describe "#partner" do 
      it "is a setter and a getter method on Person instances" do 
        beyonce.partner = jayz
        expect(beyonce.partner).to eq(jayz)
      end
    end

    describe "get_married" do 
      it "takes in an argument of another person instance and associates the two people by making them each other's partner" do 
        beyonce.get_married(jayz)
        expect(beyonce.partner).to eq(jayz)
        expect(jayz.partner).to eq(beyonce)
      end
    end
  end

end