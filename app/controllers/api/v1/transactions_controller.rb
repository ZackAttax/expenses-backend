class Api::V1::TransactionsController < ApplicationController
    before_action :set_transaction, only: [:show, :update, :destroy]
    before_action :set_account, only: [:index, :create, :destroy] 
    
    def index
        @transactions = @account.transactions

        render json: @transactions
      end
    
      # GET /transaction/1
      def show
        render json: @transaction
      end
    
      # POST /transaction
      def create
        @transaction = @account.transactions.new(transaction_params)
        if @account.update_balance(@transaction) != "transaction failed"
          @transaction.save
          render json: @account, include: :transactions
        else
          render json: @transaction.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /transaction/1
      def update
        if @transaction.update(transaction_params)
          render json: @transaction
        else
          render json: @transaction.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /transaction/1
      def destroy
        #byebug
        if @account.update_balance_on_delete(@transaction) != "transaction failed"
            @transaction.destroy
            render json: @account, include: :transactions
         else
            render json: {error: "Balance too low"}
         end
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_account
          @account = Account.find(params[:account_id])
        end
        def set_transaction
            @transaction = Transaction.find(params[:id])
          end

    def transaction_params
        params.require(:transaction).permit(:amount, :kind)
    end
end

