class Waiter
attr_accessor :name, :years_experience
    @@all = [ ]
    def initialize(name, years_experience)
        @name = name
        @years_experience = years_experience

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
    end

    def best_tipper
        #return customer associated w meal w largest tip

        # meal_tips= meals.map do |meal|
        #         meal.tip
        max_tip = meals.max do |a,b|
                a.tip <=> b.tip
            end
        max_tip.customer
    end
end