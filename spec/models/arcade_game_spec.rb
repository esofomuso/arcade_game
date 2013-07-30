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

pending "working specs" do
describe ArcadeGame do
  describe "creation" do
    let(:creation_attributes) {{
      :name => Faker::Lorem.word,
      :manufacturer => Faker::Lorem.word,
      :notes => Faker::Lorem.sentence,
      :year => (Date.today - (5 + rand(20)).years).year,
      :is_active => true
    }}

    let(:subject) { ArcadeGame.create(creation_attributes) }

    describe "validations" do
      it "accepts an ArcadeGame with all attributes" do
        expect(subject).to be_valid
      end
    end

    describe "associations" do      
      it "is associated with game_like" do
        game_like = subject.game_likes.create :clicker_ip => Faker::PhoneNumber.phone_number
        expect(subject.game_likes).to include game_like
        expect(game_like.game).to eq subject
      end
    end
  end
end
end