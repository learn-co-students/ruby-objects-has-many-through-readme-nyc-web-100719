class Waiter

    @@all = []

    def initialize(name, years_of_experience)
        @name = name
        @years_of_experience = years_of_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
        #returns array of meals w/ this waiter instance
    end

    def best_tipper
        big_tip = Meal.all.max {|x, y| x.tip <=> y.tip}
        big_tip.customer
    end





end