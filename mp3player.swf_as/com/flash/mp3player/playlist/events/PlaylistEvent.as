package com.flash.mp3player.playlist.events 
{
    import flash.events.*;
    
    public class PlaylistEvent extends flash.events.Event
    {
        public function PlaylistEvent()
        {
            super(com.flash.mp3player.playlist.events.PlaylistEvent.PLAYLIST_LOADED, true);
            return;
        }

        public static const PLAYLIST_LOADED:String="playlistLoaded";
    }
}
