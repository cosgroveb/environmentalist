class EnvironmentsController < ApplicationController
  def new
    @environment = Environment.new
  end

  def create
    @environment = Environment.new(params[:environment])

    if @environment.save
      redirect_to environments_url
    else
      render :new
    end
  end

  def index
  end
end
