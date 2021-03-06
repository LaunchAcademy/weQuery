module Admin
  class SessionArchivesController < ApplicationController
    def create
      @session = Session.find_using_slug(params[:session_id])
      if @session.archive
        redirect_to root_path, notice: 'Session archived.'
      else
        redirect_to root_path, alert: 'Session could not be archived.'
      end
    end
  end
end
