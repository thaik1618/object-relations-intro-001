# Code Along: Object Relations: An Introduction

So far, we've mainly worked with classes that do not play well with others. In other words, we've defined classes that create objects that do not interact with other jobs, only operate on themselves. For example, our Person class had method that described an individual person's attributes and behavior. A single person could have a name and tell you their name but not have a conversation with another person object. 

However, individual objects in object oriented Ruby *can interact with one another* in a number of ways. Instances of a class can take in other instances as arguments and operate on them. Instances of a class can also be *related* or associated to each other. Let's take a look at the first method of interaction: objects as arguments. 

## Code Along I: Objects as Arguments

Let's stick with our `Person` class example and give our individual people instances an opportunity to interact in a very human way––they're going to `go_on_a_date`. We'll build an instance method, `go_on_a_date` that takes in another person as an arguments. If those people are a good match, both people will become happier. In order to measure someone's happiness level, we'll give them a setter and getter `happiness` method and score their happiness on a scale of 1 to 10. 

* In `lib/person.rb`, define a `Person` class. Our people should initialize with a name and, since they feel pretty neutral on initialization, they should be initialized with a happiness level of `5`. 
* Give your `Person` class an `attr_accessor` for `name` and `happiness`. 

```ruby
class Person
  
  attr_accessor :name, :happiness
  
  def initialize(name)
    @name = name 
    @happiness = 5
  end
``` 

* Next, we need to build our `go_on_a_date` method. It should take in *another instance of `Person`* and the value of `true` or `false`, depending on whether or not our two people instances are a good romantic match: 

```ruby
class Person

    ...
   
  def go_on_a_date(person, match)
  
  end

```

* If our two lovebirds are a good match, the `go_on_a_date` method should increment *both people's happiness level by `1`*. Remember that we can access the object that we're calling an instance method on by using the `self` keyword.

```ruby
class Person

    ...
   
  def go_on_a_date(person, match)
    if match
      self.happiness += 1
    else
      #some code
    end
  end
```

* If match is `true`, we will use the `happiness` setter method to increment our person's happiness level by `1`. What about the *other* person? The one that our person is going on ta date with? The one that is getting *passed in* to the method as an argument? We can operate on it with any of the instance methods that we've defined! 

```ruby
class Person

    ...
   
  def go_on_a_date(person, match)
    if match
      self.happiness += 1
      person.happiness += 1
    else
      #some code
    end
  end
```

* Okay, what if these two are not a great match? We need to decrement their happiness levels by 1: 

```ruby
class Person

    ...
   
  def go_on_a_date(person, match)
    if match
      self.happiness += 1
      person.happiness += 1
    else
      self.happiness -= 1
      person.happiness -= 1
    end
  end
```

And that's it! We've build a way for individual instances of `Perso`n class to interact and, through doing so, change their respective attributes. Try out the code in `lib/person.rb`. If you have the tests passing, un-comment out the lines at the bottom of the file and run `ruby person.rb` in your terminal, inside the directory of this lab. You should see that we've successfully interacted our people instances and changed each of their happiness levels as a result. 

## Code Along II: Associating Objects

Let's take a look at the second manner in which instances of a class can interact: associating objects to one another. We'll stick with our `Person` class and say that Beyonce and Jay-Z had such a great date that they've decided to get married. The consequence of getting married is that Beyonce's "partner" will be Jay-Z and Jay-Z's "partner" will be Beyonce. 

* First, let's create an attr_accessor for `partner` so that we can eventually tell our two instances of `Person` class that they are each other's partner. 

```ruby
class Person
  attr_accessor :name, :happiness, :partner
  
  ...

end
```

* Now that that's taken care of, let's write out `get_married` method. The `get_married` method should take in an argument of another person instance and have the effect of creating the association that we discussed: the person on which we are calling the method should have their `partner` method set equal to the person being passed in as an argument *and* the person being passed in as an argument should have *their* partner method set equal to the person on which we are calling the method:

```ruby
class Person
  attr_accessor :name, :happiness, :partner
  
  ...
  
  def get_married(person)
    self.partner = person
    person.partner = self
  end

end
```

And that's it! Once you have your tests passing, un-comment out the second set of lines at the bottom of the `person.rb` file and run the program with `ruby lib/person.rb`. You'll see that association magic happen.

