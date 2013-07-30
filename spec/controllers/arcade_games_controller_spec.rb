pending "working specs" do
describe ArcadeGamesController do
  
  let(:params) { HashWithIndifferentAccess.new }
  let(:game1) { create(:arcade_game) }
  let(:game2) { create(:arcade_game) }
  let(:game3) { create(:arcade_game, :is_active => false) }
  let(:game4) { create(:arcade_game) }
  let(:game5) { create(:arcade_game) }
  let(:game_like1) { create(:game_like, :game => game1) }
  let(:game_like2) { create(:game_like, :game => game1) }
  let(:game_like3) { create(:game_like, :game => game4) }

  describe "exposures" do
    before do
      controller.stub :params => params
    end
    
    describe "arcade_games" do
      let(:arcade_games) { controller.arcade_games }
      
      it "Includes game1" do
        expect(arcade_games).to include game1
      end
      
      it "Does not include game3" do
        expect(arcade_games).not_to include game3
      end
    end
    
    describe "arcade_game" do
      let(:arcade_game) { controller.arcade_game }
      
      it "is an ArcadeGame" do
        expect(arcade_game).to be_a ArcadeGame
      end
    end
    
    describe "arcade_game_likes" do
      let(:arcade_game_likes) { controller.arcade_game_likes }
      
      it "is an Integer" do
        expect(arcade_game_likes).to be_a Integer
      end
    end  
  end
  describe "actions" do

  end
end
end