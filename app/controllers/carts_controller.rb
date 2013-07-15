class CartsController < InheritedResources::Base
  skip_before_filter :authenticate_admin_user!, :only => [:destroy]

  def show
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_url, :notice => 'Invalid cart'
    else
      if @cart.line_items.count.zero?
        respond_to do |format|
          format.html { redirect_to(root_url,
                                    :notice => 'Your cart is currently empty') }
          format.xml  { head :ok }
        end
      else
        respond_to do |format|
          format.html # show.html.erb
          format.xml { render :xml => @cart }
        end
      end
    end
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to(root_url,
                                :notice => 'Your cart is currently empty' ) }
      format.js
      format.xml { head :ok }
    end
  end

end
