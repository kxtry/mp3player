package com.flash.mp3player.player.events 
{
    import flash.events.*;
    
    public class MuteClickEvent extends flash.events.Event
    {
        public function MuteClickEvent(arg1:Boolean)
        {
            super(com.flash.mp3player.player.events.MuteClickEvent.MUTE, true);
            this.mute = arg1;
            return;
        }

        public static const MUTE:String="mute";

        public var mute:Boolean;
    }
}
