class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    # @bookmark = Bookmark.new(bookmark_params)
    @movie = Movie.find(params[:bookmark][:movie])
    @bookmark = Bookmark.new
    @bookmark.movie = @movie
    @bookmark.list = @list
    @bookmark.comment = params[:bookmark][:comment]
    # raise
    if @bookmark.save
      # raise
      redirect_to list_path(@list)
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie, :comment, :list_id)
  end
end
