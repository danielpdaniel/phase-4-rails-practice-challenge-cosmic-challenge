class ScientistShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :field_of_study, :avatar, :planets
  
  has_many :planets
end
