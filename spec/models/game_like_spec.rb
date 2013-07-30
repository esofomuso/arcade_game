require 'spec_helper'

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
describe GameLike do
  describe "creation" do
    let(:game) { create(:arcade_game) }  

    let(:creation_attributes) {{
      :game_id => game.id,
      :clicker_ip => Faker::PhoneNumber.phone_number
    }}

    let(:subject) { GameLike.create(creation_attributes) }

    describe "validations" do
      it "accepts an GameLike with all attributes" do
        expect(subject).to be_valid
      end

      it "rejects an GameLike with no game" do
        creation_attributes.delete :game_id
        expect(subject).not_to be_valid
      end
    end

    describe "associations" do      
      it "is associated with the country" do
        expect(subject.game).to eq game
        expect(game.game_likes).to include subject
      end
    end
  end
end