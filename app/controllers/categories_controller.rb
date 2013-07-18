class CategoriesController < InheritedResources::Base
  before_action :set_item, only: [:show, :edit, :update]
  skip_before_filter :authenticate_admin_user!

  def index
    @category = nil
    @categories = Category.where(parent_id: nil).load
  end

  def show
    # Find the category belonging to the given id
    # Grab all sub-categories
    @categories = @category.subcategories
    # We want to reuse the index renderer:
    render :action => :index
  end

  def new
    @category = Category.new
    @category.parent = Category.find(params[:id]) unless params[:id].nil?
  end

  def create
    @categories = Category.where(parent_id: nil).load
    @category = Category.new(item_params)

    if @category.save
      respond_to do |format|
        format.html { redirect_to categories_url }
        format.json { head :no_content }
      end
    end

  end

  def edit

    @category.parent = Category.find(params[:id]) unless params[:id].nil?
  end

  def update
    @categories = Category.where(parent_id: nil).load
    respond_to do |format|
      if @category.update(item_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_path }
      format.json { head :no_content }
    end
  end

  private

  def set_item
    @category = Category.find(params[:id])
  end

  def item_params
    params.require(:category).permit(:name, :parent, :parent_id)
  end

end
