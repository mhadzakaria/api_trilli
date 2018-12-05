class CardSerializer < ActiveModel::Serializer
  attributes :id, :title, :teams

  def teams
  	teams = object.teams.map { |t| {name: t.name} }
  end
end