class TicketPickerController < ApplicationController
  respond_to :html, :json

  before_filter :load_clients,  :only => [:index]
  before_filter :load_client,   :only => [:index]
  before_filter :load_projects, :only => [:index]
  before_filter :load_project,  :only => [:index]
  before_filter :load_tickets,  :only => [:index]

  protected
  def load_clients
    @clients = Client.all
  end

  def load_client
    if params[:client_id]
      @client = Client.find(params[:client_id])
    end
  end

  def load_projects
    if @client
      @projects = @client.projects.all
    end
  end

  def load_project
    if params[:project_id]
      @project = @client.projects.find(params[:project_id])
    end
  end

  def load_tickets
    if @project
      @tickets = @project.tickets.all
    end
  end

  public
  def index
    if request.xhr?
      if @client && !@project && !@ticket
        respond_with @projects
      elsif @client && @project && !@ticket
        respond_with @tickets
      end
    end
    if params[:ticket_id]
      flash[:notice] = "Ticket was selected."
      redirect_to :action => 'index'
    end
  end
end
