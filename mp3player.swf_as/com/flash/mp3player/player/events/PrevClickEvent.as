package com.flash.mp3player.player.events 
{
    import flash.events.*;
    
    public class PrevClickEvent extends flash.events.Event
    {
        public function PrevClickEvent()
        {
            super(com.flash.mp3player.player.events.PrevClickEvent.PREV, true);
            return;
        }

        public static const PREV:String="prevClick";
    }
}
