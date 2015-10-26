package com.flash.mp3player.playlist 
{
    import com.flash.mp3player.playlist.description.*;
    
    public class PlaylistModel extends Object
    {
        public function PlaylistModel()
        {
            super();
            this.arSongs = new Array();
            return;
        }

        public var viewPositionY:uint=0;

        public var settingsDesc:com.flash.mp3player.playlist.description.SettingsDesc;

        public var arSongs:Array;

        public var currentSongUID:String="0";
    }
}
