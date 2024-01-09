class Book
    attr_accessor :title, :author, :length

    def assign_values(values:)
        values.each do | key, value|
            self.send("#{key}=", value)
        end
    end
end

book = Book.new
book_info = {
    title: "1984",
    author: "George Orwell",
    length: 300
}


book.assign_values(values: book_info)

p book