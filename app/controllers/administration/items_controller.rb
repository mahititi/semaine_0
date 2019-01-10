# frozen_string_literal: true

module Administration
  class ItemsController < AdministrationController
    before_action :set_item, only: %i[show edit update destroy]

    def index
      @item = Item.all
    end

    def show; end

    def new
      @item = Item.new
    end

    def edit; end

    def create
      @item = Item.new(item_params)

      respond_to do |format|
        if @item.save
          format.html { redirect_to @item, notice: 'Product was successfully created.' }
          format.json { render :show, status: :created, location: @item }
        else
          format.html { render :new }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @item.update(item_params)
          format.html { redirect_to @item, notice: 'Price was successfully updated.' }
          format.json { render :show, status: :ok, location: @item }
        else
          format.html { render :edit }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @item.destroy
      respond_to do |format|
        format.html { redirect_to administration_items_path, notice: 'Price was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def set_product
      @item = Item.find(params[:id])
    end

    def items_params
      params.require(:item).permit(:original_price, :has_discount, :discount_percentage)
    end
end
 end
