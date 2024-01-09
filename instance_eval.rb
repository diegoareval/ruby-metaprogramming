class Developer 
end

Developer.instance_eval do
    p "instance eval - self = #{self.to_s}"
    def backend
        p "inside a method #{self.to_s}"
    end
end

Developer.backend

diego = Developer.new
diego.instance_eval do
    p "instance eval - self = #{self.to_s}"
    def backend
        p "inside a method #{self.to_s}"
    end
end

diego.backend

String.class_eval do
    def to_array
        self.split("_")
    end
end

p "El_piro_el_del_frontend".to_array