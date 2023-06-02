class Api::V1::BooksController < ApplicationController
  before_action :authenticate!
  before_action :set_book, only: %i[ show update destroy ]

  # GET /api/v1/books
  # GET /api/v1/books.json
  def index
    @books = Current.user.books
  end

  # GET /api/v1/books/1
  # GET /api/v1/books/1.json
  def show
  end

  # POST /api/v1/books
  # POST /api/v1/books.json
  def create
    @book = Current.user.books.build(book_params)

    if @book.save
      render :show, status: :created, location: [:api, :v1, @book]
    else
      render json: { status: 'fail', data: { book: @book.errors.to_hash(true) } }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/books/1
  # PATCH/PUT /api/v1/books/1.json
  def update
    if @book.update(book_params)
      render :show, status: :ok, location: [:api, :v1, @book]
    else
      render json: { status: 'fail', data: { book: @book.errors.to_hash(true) } }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/books/1
  # DELETE /api/v1/books/1.json
  def destroy
    @book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Current.user.books.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:name, :author, :read_at)
    end
end
