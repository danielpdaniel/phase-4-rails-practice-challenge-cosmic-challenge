class Mission < ApplicationRecord
    validates :name, presence: true
    validates :scientist, presence: true, uniqueness: { scope: :name }
    validates :planet, presence: true

    belongs_to :scientist
    belongs_to :planet
end
