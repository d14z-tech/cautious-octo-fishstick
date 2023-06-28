class Api::V1::QuotesController < ApplicationController
  before_action :set_book
  before_action :set_quote, only: %i[ show update destroy ]

  # GET /quotes
  # GET /quotes.json
  def index
    @quotes = @book.quotes
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
  end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote = @book.quotes.build(quote_params)

    if @quote.save
      render :show, status: :created, location: [:api, :v1, @book, @quote]
    else
      render json: { status: 'fail', data: { quote: @quote.errors.to_hash(true) } }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
    if @quote.update(quote_params)
      render :show, status: :ok, location: [:api, :v1, @book, @quote]
    else
      render json: { status: 'fail', data: { quote: @quote.errors.to_hash(true) } }, status: :unprocessable_entity
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:book_id])
    end

    def set_quote
      @quote = @book.quotes.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quote_params
      params.require(:quote).permit(:book_id, :content)
    end
end
