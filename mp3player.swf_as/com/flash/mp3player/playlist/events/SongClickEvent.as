package com.flash.mp3player.playlist.events 
{
    import com.flash.mp3player.common.vo.*;
    import flash.events.*;
    
    public class SongClickEvent extends flash.events.Event
    {
        public function SongClickEvent(arg1:com.flash.mp3player.common.vo.SongVO)
        {
            super(com.flash.mp3player.playlist.events.SongClickEvent.SONG_PLAY, true);
            this.songVO = arg1;
            return;
        }

        public static const SONG_PLAY:String="songPlay";

        public var songVO:com.flash.mp3player.common.vo.SongVO;
    }
}
