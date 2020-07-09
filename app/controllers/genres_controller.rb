class GenresController < ApplicationController

  def show
    @genre = Genre.find(params[:id])
    @genres = Genre.where(validity: true)
    @products = @genre.products.page(params[:page]).per(9)
  end

  private

  def genre_params
    params.require(:genre).permit(:name,:id)
  end
end
