module Toyable
    extend ActiveSupport::Concern
  
    included do
        has_many :toys,
        as: :toyable
    end
  
    def receive_toy(name)
        toy = Toy.find_by(name: name)
        if toy
            self.toys << toy
        else
            toy = Toy.create(name: name)
            self.toys << toy
        end
    end
  end