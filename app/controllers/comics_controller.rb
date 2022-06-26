# frozen_string_literal: true

class ComicsController < ApplicationController
  before_action :require_user_logged_in!, only: %i[my_favorites add_to_favorites]

  def index
    @pagy, @records = pagy(Comic.all.order(:on_sale_date))

    @hearts = Comic.includes(:favorite_comics)
                   .where(favorite_comics: { user_id: Current.user.id })
                   .select(:id)

    @hearts = @hearts.map { |i| [i.id, 'heart_on.png'] }.to_h
  end

  def search
    return redirect_to action: 'index' if params[:hero_name].blank?

    @pagy, @records = pagy(Comic.includes(:characters)
                                .where("lower(characters.name) = lower('#{params[:hero_name]}')")
                                .order(:on_sale_date))
    render :index
  end

  def my_favorites
    @pagy, @records = pagy(Comic.includes(:favorite_comics)
                                .where(favorite_comics: { user: Current.user })
                                .order(:on_sale_date))
    render :index
  end

  def add_to_favorites
    FavoriteComic.create(user_id: Current.user.id, comic_id: params[:comic_id])
    @heart_id = "heart_#{params[:comic_id]}"
  end

  def remove_from_favorites
    FavoriteComic.find_by(user_id: Current.user.id, comic_id: params[:comic_id]).destroy
    @heart_id = "heart_#{params[:comic_id]}"
  end
end
