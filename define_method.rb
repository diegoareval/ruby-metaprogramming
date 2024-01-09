class Shoe
    attr_accessor :title, :brand, :size
    def initialize(title, brand, size)
        @title = title
        @brand = brand
        @size = size
    end

    def self.create_method(name)
        define_method("#{name}_details") do |*args|
            puts "checking product #{self.brand}"
            p args
        end
    end
end

n = Shoe.new('nikes', 'nike', '12')
c = Shoe.new('crocs', 'croc', '11')
s = Shoe.new('Sandals', 'Americal Eagle', '9')

Shoe.create_method(n.title)
n.nikes_details("debugging", "checking")