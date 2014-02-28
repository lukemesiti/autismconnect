class DocumentsController < ApplicationController
  # SP 25/02/2014 - Remove authentication from index and detail pages. Edit/destroy/create requires login.
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  rescue_from Pundit::NotAuthorizedError, :with => :unauthorized_error

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    @documents = Document.all
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
    authorize @document
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)

    authorize @document

    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render action: 'show', status: :created, location: @document }
      else
        format.html { render action: 'new' }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    authorize @document

    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    authorize @document
    
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    def unauthorized_error
      redirect_to articles_path, :alert => "You can't touch this document!"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:name, :kind, :user_id, :asset, :tag_list)
    end
end
