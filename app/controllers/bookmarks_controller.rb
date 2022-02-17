class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    mark = params[:bookmark]
    @bookmark = Bookmark.new(list_params)
    @movie = Movie.find(mark[:movie_id])
    @bookmark.list = @list
    @bookmark.movie = @movie
    @bookmark.save
    redirect_to list_path(@list)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(@list)
  end

  private

  def list_params
    params.require(:bookmark).permit(:comment)
  end
end
