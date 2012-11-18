class CategoriesController < ApplicationController

  before_filter :authenticate

  # GET /categories
  # GET /categories.json
  def index

    @categories = Category.where("user_id = #{current_user.id}").all

    if @categories.length != 0
      respond_to do |format|
        format.html # new.html.erb
      end
    else
      redirect_to new_category_path, :alert => "You have to create your categories"
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
     @category = Category.where("user_id = #{current_user.id}").find(params[:id])
  end

  # POST /categories
  # POST /categories.json
  def create
    params[:category][:user_id] = current_user.id

    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url, notice: 'Category was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :ok }
    end
  end
end
