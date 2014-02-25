class LinksController < ApplicationController
  # SP 25/02/2014 - Remove authentication from index and detail pages. Edit/destroy/create requires login.
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  rescue_from Pundit::NotAuthorizedError, :with => :unauthorized_error

  # GET /links
  # GET /links.json
  def index
    @links = Link.all
  end

  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  def edit
    authorize @link
  end

  # POST /links
  # POST /links.json
  def create


    @link = Link.new(link_params)

    authorize @link

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render action: 'show', status: :created, location: @link }
      else
        format.html { render action: 'new' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    authorize @link

    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    authorize @link

    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    def unauthorized_error
      redirect_to links_path, :alert => "You can't touch this link!"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:name, :url, :user_id, :tag_list)
    end
end
