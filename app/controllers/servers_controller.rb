class ServersController < ApplicationController
  before_action :set_server, only: %i[ show edit update destroy ]

  # GET /servers or /servers.json
  def index
    @servers = Server.all
  end

  # GET /servers/1 or /servers/1.json
  def show
  end

  # GET /servers/new
  def new
    @server = Server.new
  end

  # GET /servers/1/edit
  def edit
  end

  # POST /servers or /servers.json
  def create
    @server = current_user.owned_servers.new(server_params)

    if @server.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /servers/1 or /servers/1.json
  def update
    if @server.update(server_params)
      redirect_to @server, notice: "Server was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /servers/1 or /servers/1.json
  def destroy
    @server.destroy!

    respond_to do |format|
      format.html { redirect_to servers_path, status: :see_other, notice: "Server was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_server
      @server = Server.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def server_params
      params.expect(server: [ :name, :image ])
    end

  end