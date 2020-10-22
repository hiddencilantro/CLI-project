class League

    @@all = []

    attr_accessor :name

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.find_or_create_by_name(name)
        found_league = self.all.detect {|league| league.name == name}
        if found_league
            return found_league
        else
            return self.new(name)
        end
    end

end
