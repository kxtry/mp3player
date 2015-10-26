package com.flash.mp3player.player.events 
{
    import flash.events.*;
    
    public class NextClickEvent extends flash.events.Event
    {
        public function NextClickEvent()
        {
            super(com.flash.mp3player.player.events.NextClickEvent.NEXT, true);
            return;
        }

        public static const NEXT:String="nextClick";
    }
}
