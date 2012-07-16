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

  def show
    environment = Environment.find(params[:id])

    respond_to do |format|
      format.html { redirect_to environments_url}
      format.json { render :json => environment }
    end
  end

  def reserve
    environment = Environment.find(params[:id])

    environment.update_attributes(:reserved_by => params[:environment][:reserved_by])

    respond_to do |format|
      format.html { redirect_to environments_url }
      format.json { render :json => environment }
    end
  end

  def release
    environment = Environment.find(params[:id])

    environment.update_attributes(:reserved_by => '')

    respond_to do |format|
      format.html { redirect_to environments_url }
      format.json { render :json => environment }
    end
  end
end
