class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end


# class validates :name, presence: true, length: {in: 2..20 }
