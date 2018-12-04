class CreateTeamsCardsJoinTable < ActiveRecord::Migration[5.1]
  def change
  	create_join_table :teams, :cards
  end
end
