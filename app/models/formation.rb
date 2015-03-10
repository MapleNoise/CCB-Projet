# coding:utf-8
class Formation < ActiveRecord::Base

  validates_presence_of :nom
  validates :nom, length: { minimum: 4 , too_short: "Le minimum requis est de %{count} caracteres"}
  validates :nom, length: { maximum: 50 , too_long: "Le maximum requis est de %{count} caracteres"}

  has_many :sections
  has_and_belongs_to_many :tags

  self.per_page = 5

  # Gestion de la suppression d'un produit
  def delete!
    update_attribute(:dateSuppression, Time.now)
  end

  # Initialise l'instance de produit pour générer une référence.
  def init!
    self.ref = Digest::MD5.hexdigest((Time.now).strftime("%Y%m%dT%H%M%S%L%z"))[10..25].encode("utf-8")
  end

end
