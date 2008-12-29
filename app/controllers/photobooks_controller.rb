class PhotobooksController < ApplicationController
  before_filter :load_photobook, :only => [:edit, :update, :destroy]

  def index
    @photobooks = Photobook.all
    respond_to do |format|
      format.html
      format.xml { @photobooks.to_xml }
    end
  end
  
  def new
    @photobook = Photobook.new
  end
  
  def create
    @photobook = Photobook.new(params[:photobook])
    respond_to do |format|
      if @photobook.save
        format.html { flash[:notice] = t("photobook.created", @photobook) }
        format.xml  { head :created, :location => @photobook }
      else
        format.html { flash[:error] = t("photobook.created_fail", @photobook) }
        format.xml  { head :unprocessable_entity } 
      end
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @photobook.update_attributes(params[:photobook])
        format.html { flash[:notice] = t("photobook.updated", @photobook) }
        format.xml  { head :ok }
      else
        format.html { flash[:error] = t("photobook.updated_fail", @photobook) }
        format.xml  { head :unprocessable_entity } 
      end
    end    
  end
  
  def destroy
    respond_to do |format|
      if @photobook.destroy
        format.html { flash[:notice] = t("photobook.deleted", @photobook) }
        format.xml  { head :ok }
      else
        format.html { flash[:error] = t("photobook.deleted_fail", @photobook) }
        format.xml  { head :forbidden } 
      end
    end    
  end
  
private
  def load_photobook
    @photobook = Photobook.find(params[:id])
  end
end
