# frozen_string_literal: true

class ComicsController < ApplicationController
  def index
    @pagy, @records = pagy(Comic.all.order(:on_sale_date))
  end

  def search
    @pagy, @records = pagy(Comic.joins(:characters).where("lower(characters.name) = lower('#{params[:hero_name]}')").order(:on_sale_date))
    render :index
  end
end
