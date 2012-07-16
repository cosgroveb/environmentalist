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
    @environments = Environment.all

    respond_to do |format|
      format.html
      format.json { render :json => @environments }
    end
  end
end
