class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  # before_action :authorize_admin

  def index
    if params[:search]
      @products = Product.where("title LIKE ?", "%#{params[:search]}%").page(params[:page]).per(3)
    else
      @products = Product.page(params[:page])
    end

  end


  def show
  end

  def new
    @product = Product.new
  end


  def edit
  end


  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
      else
        puts @product.errors.full_messages
        format.html { render :new, status: :unprocessable_entity }
        end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }

        @products = Product.all.order(:title)
        ActionCable.server.broadcast 'products',
          html: render_to_string('store/index', layout: false)
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def who_bought
    @product = Product.find(params[:id])
    @latest_order = @product.orders.order(:updated_at).last
    if stale!(@latest_order) #stale checks if the given resource checks if the given resource is stale or not.
      respond_to do |format|
        format.atom
      end
    end
  end


  private
     def set_product
      @product = Product.find(params[:id])
    end

     def product_params
      params.require(:product).permit(:title, :decription, :image_url, :price)
    end
end
