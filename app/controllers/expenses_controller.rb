class ExpensesController < ApplicationController

  before_filter :authenticate

  # GET /expenses
  # GET /expenses.json
  def index

    @expenses = Expense.where("user_id = #{current_user.id}").order('created_at DESC')

    # added
    @categories = Category.where("user_id = #{current_user.id}")
    # @types = Type.all

    if @categories.length != 0
      respond_to do |format|
        format.html # new.html.erb
      end
    else
      redirect_to new_category_path, :alert => "Before creating expense or entry you have to create your categories"
    end
  end

  # GET /expenses/new
  # GET /expenses/new.json
  def new
    @expense = Expense.new

    @categories = Category.where("user_id = #{current_user.id}")
    # @types = Type.where("user_id = #{current_user.id}").all

     if @categories.length != 0
      respond_to do |format|
        format.html # new.html.erb
      end
    else
      redirect_to new_category_path, :alert => "Before creating expense or entry you have to create your categories"
    end
  end

  # GET /expenses/1/edit
  def edit
    @expense = Expense.where("user_id = #{current_user.id}").find(params[:id])
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

  # POST /expenses
  # POST /expenses.json
  def create

    params[:expense][:user_id] = current_user.id

    @expense = Expense.new(params[:expense])
    respond_to do |format|
      if @expense.save
        format.html { redirect_to expenses_url, notice: 'Expense was successfully created.' }
      else
        format.html { render action: "new" }
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
      else
        format.html { render action: "edit" }
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
    end
  end
end
