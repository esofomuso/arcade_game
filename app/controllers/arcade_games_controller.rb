class ArcadeGamesController < ApplicationController
  
  # The first 25 active arcade_games.
  # @return [ArcadeGame]
  expose(:arcade_games) {ArcadeGame.active.order("year desc").limit 25}
  
  # The arcade_game that is being created or modified.
  # @return [ArcadeGame]
  expose(:arcade_game)
  
  # The game_likes for given arcade_game.
  # @return [GameLike]
  expose(:arcade_game_likes) { arcade_game.game_likes.size }
  
  # GET /arcade_games
  # GET /arcade_games.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @arcade_games }
    end
  end

  # GET /arcade_games/1
  # GET /arcade_games/1.json
  def show
    arcade_game_likes

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @arcade_game }
    end
  end

  def add_like
    game_like = arcade_game.game_likes.new(:clicker_ip => request.remote_ip)

    respond_to do |format|
      if game_like.save
        @arcade_game_likes = arcade_game_likes.size
        puts @arcade_game_likes
        format.html { }
        format.js {render :layout => false }
        format.json { }
      else
        format.html { }
        format.json { }
        render :layout => false
      end
    end
     
  end


  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def arcade_game_params
      params.require(:arcade_game).permit(:is_active, :manufacturer, :name, :notes, :timestamp, :year)
    end
end
