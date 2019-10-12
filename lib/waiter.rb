class Waiter

    attr_accessor :name, :yrs_experience
    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self 
    end

    def self.all 
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end 

    #Candy.meals
    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end 
    end 
    
    #Candy.best_tipper 
    #go through array of all meals
    # get meal with highest/MAX tip (not tip itself)
    #return that meal's customer
    def best_tipper
        meal_with_highest_tip = meals.max do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
         end

         meal_with_highest_tip.customer 
    end
        
  
end