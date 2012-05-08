class ExpensesController < ApplicationController

  before_filter :authenticate
  
  # GET /expenses
  # GET /expenses.json
  def index
    
    if !current_user.blank?
      @expenses = Expense.where("user_id = #{current_user.id}").all  
    else
      @expenses = Expense.all
    end
    
    # added
    @categories = Category.all
    @types = Type.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expenses }
    end
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
    @expense = Expense.find(params[:id])
    
    # adding additionals fields 
    @category_name = Category.find(@expense.category_id).name
    @type_name = Type.find(@expense.type_id).name
    @user_name = User.find(@expense.user_id).email

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @expense }
    end
  end

  # GET /expenses/new
  # GET /expenses/new.json
  def new
    @expense = Expense.new

    @categories = Category.where("user_id = #{current_user.id}").all
    @types = Type.where("user_id = #{current_user.id}").all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @expense }
    end
  end

  # GET /expenses/1/edit
  def edit
    @expense = Expense.where("user_id = #{current_user.id}").find(params[:id])
    @categories = Category.where("user_id = #{current_user.id}").all
    @types = Type.where("user_id = #{current_user.id}").all
  end

  # POST /expenses
  # POST /expenses.json
  def create
    
    params[:expense][:user_id] = current_user.id

    @expense = Expense.new(params[:expense])
    respond_to do |format|
      if @expense.save
        format.html { redirect_to @expense, notice: 'Expense was successfully created.' }
        format.json { render json: @expense, status: :created, location: @expense }
      else
        format.html { render action: "new" }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /expenses/1
  # PUT /expenses/1.json
  def update
    @expense = Expense.find(params[:id])

    respond_to do |format|
      if @expense.update_attributes(params[:expense])
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to expenses_url }
      format.json { head :ok }
    end
  end
end
