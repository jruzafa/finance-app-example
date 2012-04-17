class EntriesController < ApplicationController
  
  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.find_by_user(current_user.id)

    # added
    @categories = Category.all
    @types = Type.all
    #@users = User.a

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entries }
    end
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    @entry = Entry.find(params[:id])
    
    # adding additionals fields 
    @category_name = Category.find(@entry.category_id).name
    @type_name = Type.find(@entry.type_id).name
    @user_name = User.find(@entry.user_id).email
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.json
  def new
    @entry = Entry.new
    # @user = current_user
    @categories = Category.all
    @types = Type.all
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/1/edit
  def edit
   
    @entry = Entry.find(params[:id])
    @categories = Category.all
    @types = Type.all
  end

  # POST /entries
  # POST /entries.json
  def create
    # assings a user_id with logged id user
    params[:entry][:user_id] = current_user.id

    @entry = Entry.new(params[:entry])

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render json: @entry, status: :created, location: @entry }
      else
        format.html { render action: "new" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
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
