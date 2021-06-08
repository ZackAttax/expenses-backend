class Api:V1:TransactionsController < ApplicationController
    before_action :set_transaction, only: [:show, :update, :destroy]
    
    def index

        @transaction = Transaction.all
    
        render json: @transaction
      end
    
      # GET /transaction/1
      def show
        render json: @transaction
      end
    
      # POST /transaction
      def create
        @transaction = Transaction.new(transaction_params)
    
        if @transaction.save
          render json: @transaction, status: :created, transaction: @transaction
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
        @transaction.destroy
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_transaction
          @transaction = Transaction.find(params[:id])
        end

    def transaction_params
        params.require(:transaction).permit(:blance, :name)
    end
end
end
