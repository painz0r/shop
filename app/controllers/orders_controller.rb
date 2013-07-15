class OrdersController < InheritedResources::Base
  skip_before_filter :authenticate_admin_user!, :only => [:new, :create, :show]

  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to root_url, :notice => "Your cart is empty"
      return
    end
    @order = Order.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @order }
    end
  end

  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  def index
    @orders = Order.paginate page: params[:page],
                             order: "created_at desc", per_page: 10

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update(item_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(item_params)
    @order.add_line_items_from_cart(current_cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        Notifier.order_received(@order).deliver
        format.html { redirect_to(root_url,
                                  notice: 'Thank you for your order.') }
        format.json { render json: @order, status: :created,
                             location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  private

  def item_params
    params.require(:order).permit(:name, :address, :email, :pay_type, :surname, :telephone, :city, :delivery_type)
  end

end
