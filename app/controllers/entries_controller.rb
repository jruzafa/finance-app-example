class EntriesController < ApplicationController

  before_filter :authenticate

  # GET /entries
  # GET /entries.json
  def index

    @entries = Entry.where("user_id = #{current_user.id}").all

    # added
    @categories = Category.where("user_id = #{current_user.id}").all
    # @types = Type.all

   if @categories.length != 0
      respond_to do |format|
        format.html # new.html.erb
      end
    else
      redirect_to new_category_path, :alert => "Before creating expense or entry you have to create your categories"
    end

  end

  # GET /entries/new
  # GET /entries/new.json
  def new
    @entry = Entry.new

    @categories = Category.where("user_id = #{current_user.id}").all
    # @types = Type.where("user_id = #{current_user.id}").all

    # if the user not category redirect to new category
    if @categories.length != 0
      respond_to do |format|
        format.html # new.html.erb
      end
    else
      redirect_to new_category_path, :alert => "Before creating expense you have to create your categories"
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = Entry.where("user_id = #{current_user.id}").find(params[:id])
    @categories = Category.where("user_id = #{current_user.id}").all
    # @types = Type.where("user_id = #{current_user.id}").all
   if @categories.length != 0
      respond_to do |format|
        format.html # new.html.erb
      end
    else
      redirect_to new_category_path, :alert => "Before creating expense or entry you have to create your categories"
    end
  end

  # POST /entries
  # POST /entries.json
  def create
    # assings a user_id with logged id user
    params[:entry][:user_id] = current_user.id

    @entry = Entry.new(params[:entry])

    respond_to do |format|
      if @entry.save
        format.html { redirect_to entries_url, notice: 'Entry was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.json
  def update
    @entry = Entry.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to entries_url }
      format.json { head :ok }
    end
  end
end
