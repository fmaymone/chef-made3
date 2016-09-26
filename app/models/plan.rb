class Plan < ActiveRecord::Base
    has_many :user
    enum status: { basic: 0, professional:1 }
end
