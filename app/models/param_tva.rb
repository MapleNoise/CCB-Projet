#encoding: UTF-8
class ParamTva < ActiveRecord::Base

  validates_presence_of :label, :valeur
  validates :valeur, numericality: { :greater_than_or_equal_to => 0 }
  def update(params)
    # Cette méthode ne doit pas être implémentée car la valeur de TVA ne peut pas être changé.
    # Si on veut faire une modification il faut créer une nouvelle TVA
    fail "La TVA ne peut pas être modifiée"
  end

  def getValideTVA(date=Time.now)
    return ParamTva.where(["created_at < :dateNow and
    (dateSuppression > :dateNow or dateSuppression is null)",
        {dateNow: date}])
  end

  def delete!
    update_attribute(:dateSuppression, Time.now)
  end

end
