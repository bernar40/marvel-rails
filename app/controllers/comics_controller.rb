# frozen_string_literal: true

class ComicsController < ApplicationController
  before_action :require_user_logged_in!, only: %i[search_favorites my_favorites add_to_favorites remove_from_favorites]

  def index
    @pagy, @records = pagy(Comic.all)

    retrive_favorites
  end

  def search
    return redirect_to action: 'index' if params[:hero_name].blank?

    @pagy, @records = pagy(Comic.search(params[:hero_name]))

    retrive_favorites

    render :index
  end

  def search_favorites
    return redirect_to action: 'my_favorites' if params[:hero_name].blank?

    @pagy, @records = pagy(Comic.favorites(Current.user)
                                .search(params[:hero_name]))

    retrive_favorites

    @favorite_search = true

    render :index
  end

  def my_favorites
    @pagy, @records = pagy(Comic.favorites(Current.user))

    @hearts = @records.map { |i| [i.id, 'heart_on.png'] }.to_h

    @favorite_search = true

    render :index
  end

  def add_to_favorites
    FavoriteComic.create(user_id: Current.user.id, comic_id: params[:comic_id])
    @heart_id = "heart_#{params[:comic_id]}"
    @comic_id = params[:comic_id]
  end

  def remove_from_favorites
    FavoriteComic.find_by(user_id: Current.user.id, comic_id: params[:comic_id]).destroy
    @heart_id = "heart_#{params[:comic_id]}"
    @comic_id = params[:comic_id]
  end

  private

  def retrive_favorites
    if Current.user
      @hearts = Comic.joins(:favorite_comics)
                     .where(favorite_comics: { user_id: Current.user.id })
                     .select(:id)

      @hearts = @hearts.map { |i| [i.id, 'heart_on.png'] }.to_h
    else
      @hearts = {}
    end
  end
end
