class FavoritesController < ApplicationController
  def create
    @psychology_test = PsychologyTest.find(params[:favorite][:psychology_test_id])
    current_user.favorites.create(psychology_test: @psychology_test)
  end

  def destroy
    @psychology_test = Favorite.find(params[:id]).psychology_test
    current_user.favorites.find_by(psychology_test: @psychology_test).destroy
  end
end
