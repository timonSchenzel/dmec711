class ClientController < ApplicationController
  def index
    @clients = Client.all()
    @therapist = Therapist.find(current_user.id)
  end

  def show
    @client = Client.find(params[:id])
    @dossiers = @client.dossier
    @notes = @client.notes
    @clients = Client.all()
    @therapist = Therapist.find(current_user.id)
  end

  def ajax_show
    @client = Client.find(params[:id])
    @dossiers = @client.dossier
    @notes = @client.notes
    @clients = Client.all()
    @therapist = Therapist.find(current_user.id)
  end
end