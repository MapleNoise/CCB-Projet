class AjoutDesLiaisonsFormation < ActiveRecord::Migration
  def change
    add_reference(:sections, :formations)
    add_reference(:chapitres, :sections)
    add_reference(:quizzs, :chapitres)
    add_reference(:questions, :quizzs)
    add_reference(:reponses, :questions)
  end
end
