# frozen_string_literal: true

class ComicsController < ApplicationController
  def index
    @pagy, @records = pagy(Comic.all)
  end
end
