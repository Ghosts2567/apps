require 'ruby_lokalise_api'

class ProjectsController < ApplicationController
  before_action :check_token

  def index
    client = RubyLokaliseApi.oauth2_client session[:lokalise_token]
    @projects = client.projects(limit: 5000).collection.map {|p| {id: p.project_id, name: p.name} }
  end

  def choose
    session[:lokalise_project_id] = params[:project_id]
    redirect_to oauth2_flows_new_path
  end
end