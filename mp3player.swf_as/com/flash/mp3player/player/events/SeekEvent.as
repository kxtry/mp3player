package com.flash.mp3player.player.events 
{
    import flash.events.*;
    
    public class SeekEvent extends flash.events.Event
    {
        public function SeekEvent(arg1:Number)
        {
            super(com.flash.mp3player.player.events.SeekEvent.SEEK, true);
            this.seek = arg1;
            return;
        }

        public static const SEEK:String="seek";

        public var seek:Number;
    }
}
