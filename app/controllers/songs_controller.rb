class SongsController < ApplicationController
  def create
    song = Song.create(song_params)
    playlist = Playlist.find(params[:playlist_id])
    song.playlist = playlist
    song.save

    redirect_to playlist, notice: 'Se creo po wn'
  end

  def destroy
    @playlist = Playlist.find(params[:playlist_id])
    song = Song.find(params[:id])
    song.destroy

    redirect_to @playlist, notice: 'Se elimino la cancion po wn'
  end

  private
  def song_params
    params.require(:song).permit(:artist, :name)
  end
end
