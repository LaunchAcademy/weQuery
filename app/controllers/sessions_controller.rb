class SessionsController < ApplicationController
  before_action :authenticate_user!
  inherit_resources
  actions :index

  protected
  def collection
    @sessions ||= end_of_association_chain.page(params[:page])
  end
end
