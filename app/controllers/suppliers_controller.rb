class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :fix_params, only: [:create, :update]

  # GET /suppliers
  def index
    @suppliers = Supplier.where(user_id: current_user.id).paginate(page: params[:page], per_page: 10)
  end

  # GET /suppliers/1
  def show
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers
  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      current_user.suppliers.push(@supplier)
      redirect_to @supplier, notice: 'Supplier was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /suppliers/1
  def update
    if @supplier.update(supplier_params)
      redirect_to @supplier, notice: 'Supplier was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /suppliers/1
  def destroy
    @supplier.destroy
    redirect_to suppliers_url, notice: 'Supplier was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def supplier_params
      params.require(:supplier).permit(:name, :nit, :contact_name, :contact_num, :bank_name, :bank_account)
      
    end

    def valid_float(string)
      true if Float string rescue false
    end

    def fix_params
      if !valid_float(params[:supplier][:nit_2]) || !valid_float(params[:supplier][:nit_1])
        redirect_back(fallback_location: root_path, alert: 'ERROR: NIT debe ser un número')
      end
      if !params[:supplier][:nit_2].empty?
        params[:supplier][:nit] = "#{params[:supplier][:nit_1]}-#{params[:supplier][:nit_2]}"
        params[:supplier].delete(:nit_2)
        params[:supplier].delete(:nit_1)
      else
        params[:supplier][:nit] = params[:supplier][:nit_1]
      end
    end
end
