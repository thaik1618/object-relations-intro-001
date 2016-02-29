class Person

  attr_accessor :name, :happiness, :partner

  def initialize(name)
    @name = name
    @happiness = 5
  end

  def go_on_a_date(person, match)
    if match 
      self.happiness += 1
      person.happiness += 1
    else
      self.happiness -= 1
      person.happiness -= 1
    end
  end

  def get_married(person)
    self.partner = person
    person.partner = self
  end
end

#When your tests pertaining to the first code along are passing, un-comment out the below!

beyonce = Person.new("Beyonce")
jayz = Person.new("Jay-Z")
beyonce.go_on_a_date(jayz, true)
puts beyonce.happiness
puts jayz.happiness

#When your tests pertaining to the second code along are passing, un-comment out the below!

beyonce.get_married(jayz)
puts "Beyonce's partner is #{beyonce.partner.name}"
puts "Jay-Z's partner is #{jayz.partner.name}"



