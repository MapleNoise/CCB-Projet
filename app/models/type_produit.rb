class TypeProduit < ActiveRecord::Base
  validates_presence_of :nom, :format
  validates :nom, length: { minimum: 4 , too_short: "Le minimum requis est de %{count} caracteres"} , uniqueness: true
  validates :nom, length: { maximum: 40 , too_long: "Le maximum requis est de %{count} caracteres"}
end
