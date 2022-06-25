# frozen_string_literal: true

class ComicsController < ApplicationController
  def index
    @pagy, @records = pagy(Comic.all.order(:on_sale_date))
  end
end
