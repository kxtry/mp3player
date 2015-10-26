package com.flash.mp3player.player.events 
{
    import flash.events.*;
    
    public class VolumeEvent extends flash.events.Event
    {
        public function VolumeEvent(arg1:Number)
        {
            super(com.flash.mp3player.player.events.VolumeEvent.CHANGE_VOLUME, true);
            this.volume = arg1;
            return;
        }

        public static const CHANGE_VOLUME:String="changeVolume";

        public var volume:Number;
    }
}
