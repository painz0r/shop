class LineItemsController < InheritedResources::Base

  def create
    @cart = current_cart
    item = Item.find(params[:item_id])
    @line_item = @cart.add_item(item.id)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to(root_url) }
        format.js { @current_item = @line_item }
        format.xml { render :xml => @line_item,
                            :status => :created, :location => @line_item }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @line_item.errors,
                            :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart = current_cart
    @line_item = LineItem.find(params[:id])
    if @line_item.quantity > 1
      @line_item.update_attributes(:quantity => @line_item.quantity - 1)
    else
      @line_item.destroy
    end
    respond_to do |format|
      if params[:action] == "index"
        format.html { redirect_to(root_path,
                                  :notice => 'Your item was deleted' ) }
      format.js
      else
      format.html { redirect_to(current_cart,
                                :notice => 'Your item was deleted' ) }
      format.js
      end
      format.xml { head :ok }
    end
  end

end
