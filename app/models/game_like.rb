# == Schema Information
#
# Table name: GameLikes
#
#  id           :integer          not null, primary key
#  game_id      :integer
#  clicker_ip   :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class GameLike < ActiveRecord::Base
  attr_accessible :clicker_ip, :game_id
  
  belongs_to :game, :class_name => 'ArcadeGame'
  
  validates :game, :presence => true
  
end
