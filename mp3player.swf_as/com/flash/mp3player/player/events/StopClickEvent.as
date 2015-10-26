package com.flash.mp3player.player.events 
{
    import flash.events.*;
    
    public class StopClickEvent extends flash.events.Event
    {
        public function StopClickEvent()
        {
            super(com.flash.mp3player.player.events.StopClickEvent.STOP, true);
            return;
        }

        public static const STOP:String="stop";
    }
}
