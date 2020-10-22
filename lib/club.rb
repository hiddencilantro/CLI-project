class Club

    @@all = []

    attr_accessor :name

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.print_all_clubs
        self.all.each_with_index {|club, index| puts "#{index + 1}. #{club.name}"}
    end

end
