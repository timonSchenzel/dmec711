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

    view_data = render_to_string(:partial => 'client/ajax_show', :content_type => 'text/html')
    respond_to do |format|
      format.json { render :json => {
          :client => @client, :html => view_data
        }
      }
    end
  end
end