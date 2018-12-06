class CardSerializer < ActiveModel::Serializer
  attributes :id, :title, :teams

  def teams
    teams = object.teams.map { |t| {id: t.id, name: t.name} }
  end
end