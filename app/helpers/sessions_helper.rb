module SessionsHelper
  def current_utilisateur=(utilisateur)
    @current_utilisateur = utilisateur
end

def current_utilisateur
    @current_utilisateur ||= utilisateur_from_remember_token
end
end
