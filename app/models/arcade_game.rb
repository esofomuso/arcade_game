# == Schema Information
#
# Table name: arcade_games
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  manufacturer :string(255)
#  notes        :string(255)
#  is_active    :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ArcadeGame < ActiveRecord::Base
  attr_accessible :is_active, :manufacturer, :name, :notes, :timestamp, :year
  
  has_many :game_likes, :dependent => :destroy, :foreign_key => :game_id
  
  # This method gets all active games.
  # @return [ArcadeGame]
  def self.active
    where :is_active => true
  end
  
  # This method determines the absolute path for posible jpg image for given game.
  # @return [String]
  def image_jpg_path
    "%s/app/assets/images/game_images/%s.jpg" %[Rails.root, self.name.dehumanize]
  end
  
  # This method determines the absolute path for posible png image for given game.
  # @return [String]
  def image_png_path
    "%s/app/assets/images/game_images/%s.png" %[Rails.root, self.name.dehumanize]
  end
  
  # This method determines the path of the image for given game
  # provided files exists
  # @return [String]
  #   image_path to the file or nil if file down't exist.
  def image
    if File.exists?(self.image_jpg_path)
      "/assets/game_images/%s.jpg" %[self.name.dehumanize]
    elsif File.exists?(self.image_png_path)
      "/assets/game_images/%s.png" %[self.name.dehumanize]
    else
      nil
    end
  end
end
