require "pry"

class Customer

    attr_accessor :name, :age 

    @@all = []

 def initialize(name, age)
    @name = name
    @age = age
    @@all << self 
 end

 def self.all
    @@all 
 end 

 #Ideal code: Joe.new_meal --> <Customer ID 00000XX7X003457836458 name: waiter: total: tip 
 # ___.new 

    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
    end 

      #LK.meals
    def meals
        Meal.all.select do |meal|
        meal.customer == self
        end
    end 
 
    #want LK.waiters
    #array of waiter instances 
    #get those that match the customer's meals

    #ORRRRRR use the helper method and FIRST get an array of meals from above
    # return array of waiter instances associated by customer that I'm calling the method on  
    def waiters
     meals.map do |meal|
        meal.waiter
     end
    end 

end #end of Customer class