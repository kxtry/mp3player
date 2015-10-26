package com.flash.mp3player.player 
{
    import com.flash.mp3player.common.vo.*;
    
    public class PlayerModel extends Object
    {
        public function PlayerModel()
        {
            super();
            return;
        }

        public var curSong:com.flash.mp3player.common.vo.SongVO;

        public var curPosition:uint=0;

        public var curVolume:Number=1;

        public var muted:Boolean=false;

        public var isPlaying:Boolean=false;

        public var isRepeated:Boolean=false;
    }
}
