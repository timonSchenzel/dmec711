class DossierController < ApplicationController

  def show
    @client = Client.find(params[:id])
    @dossier = @client.dossier(params[:dossier])
  end

  def new
    @dossier = Dossier.find(params[:dossier])
    # nog toevoegen
  end

  def edit
    @dossier = Dossier.find(params[:dossier])
    # nog toevoegen
  end

  def update
    @dossier = Dossier.find(params[:dossier])
    # nog toevoegen
  end

  def delete
    @dossier = Dossier.find(params[:dossier])
    @dossier.destroy
  end

  def create
    @dossier = Dossier.find(params[:dossier])
    # nog toevoegen
  end
end