class Book
    attr_accessor :title

    def method_missing(method_name, *arguments, &block)
        p method_name.to_s + " does not exist"
    end
end

# Book.new.test_method


class Subject
    attr_reader :grades
    def initialize
        @grades = [
        {subject: "math", student: "james", grade: 100},
            {subject: "science", student: "james", grade: 90},
            {subject: "math", student: "sara", grade: 75},
            {subject: "science", student: "sara", grade: 100}
        ]
    end

    def get_grade(subject, student)
        grades.find { |grade|  grade[:subject] == subject && grade[:student] == student}.fetch(:grade)
    end
end

class Student
    attr_reader :name
    def initialize(name)
        @name = name
    end

    def method_missing(method_name, *args, &block)
        if method_name.to_s.start_with?("get_grade_for")
            subject = method_name.to_s.split("_").last
            grade = Subject.new.get_grade(subject, self.name)
            "You got #{grade} in #{subject}"
        else
            super
        end
    end
end

james = Student.new('james')
p james.get_grade_for_science
p james.get_grade_for_math

sara = Student.new('sara')
p sara.get_grade_for_science
p sara.get_grade_for_math