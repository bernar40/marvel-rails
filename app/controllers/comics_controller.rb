# frozen_string_literal: true

class ComicsController < ApplicationController
  def index
    @pagy, @records = pagy(Comic.all.order(:on_sale_date))
  end

  def search
    return redirect_to action: 'index' if params[:hero_name].blank?

    @pagy, @records = pagy(Comic.joins(:characters)
                                .where("lower(characters.name) = lower('#{params[:hero_name]}')")
                                .order(:on_sale_date))
    render :index
  end
end
