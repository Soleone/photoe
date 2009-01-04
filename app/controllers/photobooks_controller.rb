class PhotobooksController < ApplicationController
  before_filter :load_photobook, :only => [:edit, :update, :destroy]
  before_filter :load_user

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
    @photobook.user = @user
    respond_to do |format|
      if @photobook.save
        flash[:notice] = t("photobook.created")
        format.html { redirect_to [@user, @photobook] }
        format.xml  { head :created, :location => [@user, @photobook] }
      else
        format.html { flash[:error] = t("photobook.created_fail") }
        format.xml  { head :unprocessable_entity } 
      end
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @photobook.update_attributes(params[:photobook])
        flash[:notice] = t("photobook.updated")
        format.html { redirect_to [@user, @photobook] }
        format.xml  { head :ok }
      else
        format.html { flash[:error] = t("photobook.updated_fail") }
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
  
  def load_user
    @user = params[:user_id] ? User.find(params[:user_id]) : current_user
  end
end