class ClientController < ApplicationController
  def index
    @clients = Client.all()
  end

  def show
    @client = Client.find(params[:id])
    @dossiers = @client.dossier
    @notes = @client.notes
    @therapies = @client.therapies
  end
end