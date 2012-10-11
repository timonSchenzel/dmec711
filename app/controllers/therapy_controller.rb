class TherapyController < ApplicationController
  def index
     @therapies = Therapy.all
  end

  def show
     @therapy = Therapy.find(params[:therapy])
  end

  def edit

  end

  def update

  end

  def delete

  end

  def new

  end

  def create

  end
end
