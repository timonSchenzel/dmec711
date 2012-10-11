class NoteController < ApplicationController

  def show
    @client = Client.find(params[:client])
    @note = Notes.find(params[:note])
  end

  def new
    @client = Client.find(params[:client])
    # nog toevoegen
  end

  def edit
    @client = Client.find(params[:client])
    @note = Note.find(params[:note])
    # nog toevoegen
  end

  def update
    @client = Client.find(params[:client])
    @note = Note.find(params[:note])
    # nog toevoegen
  end

  def delete
    @client = Client.find(params[:client])
    @note = Note.find(params[:note])
    @note.destroy
  end

  def create
    @client = Client.find(params[:client])
    # nog toevoegen
  end
end