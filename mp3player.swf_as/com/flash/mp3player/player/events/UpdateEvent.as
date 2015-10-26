package com.flash.mp3player.player.events 
{
    import com.flash.mp3player.common.vo.*;
    import flash.events.*;
    
    public class UpdateEvent extends flash.events.Event
    {
        public function UpdateEvent(arg1:com.flash.mp3player.common.vo.SongVO)
        {
            super(com.flash.mp3player.player.events.UpdateEvent.UPDATE, true);
            this.songVO = arg1;
            return;
        }

        public static const UPDATE:String="update";

        public var songVO:com.flash.mp3player.common.vo.SongVO;
    }
}
