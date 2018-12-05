class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :cards

  def cards
  	cards = object.cards.map do |c| 
  		{
  			id: c.id,
  			teams: teams(c),
  			title: c.title
  		} 
  	end

  	return cards
  end

  def teams(card)
  	teams = card.teams.map { |t| {name: t.name} }
  end
end