class NotesController < ApplicationController

  include ActionView::Helpers::TextHelper

  before_filter :login_required
  def index
    
  end
  
  def new
    @note = Note.new
  end
  
  def create
    note = current_user.sent_notes.create!(params[:note])
    flash[:notice] = "Note sent to #{note.recipient.email}"
    if current_facebook_user
      current_facebook_user.fetch
      current_facebook_user.feed_create(
        Mogli::Post.new(:name => "#{current_facebook_user.name} sent a note using notes!",
                        :link=>note_url(note),
                        :description=>truncate(note.body,:length=>100)))
    end
    redirect_to notes_path
  end
end
