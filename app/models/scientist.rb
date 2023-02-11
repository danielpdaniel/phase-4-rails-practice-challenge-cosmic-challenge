class Scientist < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :field_of_study, presence: true

    has_many :missions, dependent: :destroy
    has_many :planets, through: :missions
end
