class Api:V1:AccountsController < ApplicationController
    before_action :set_account, only: [:show, :update, :destroy]
    
    def index
        @account = Account.all
    
        render json: @account
      end
    
      # GET /account/1
      def show
        render json: @account
      end
    
      # POST /account
      def create
        @account = account.new(account_params)
    
        if @account.save
          render json: @account, status: :created, transaction: @account
        else
          render json: @account.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /account/1
      def update
        if @account.update(account_params)
          render json: @account
        else
          render json: @account.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /account/1
      def destroy
        @account.destroy
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_account
          @account = account.find(params[:id])
        end

    def account_params
        params.require(:account).permit(:blance, :name)
    end
end
