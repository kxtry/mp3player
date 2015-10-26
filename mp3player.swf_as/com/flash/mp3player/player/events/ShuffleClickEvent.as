package com.flash.mp3player.player.events 
{
    import flash.events.*;
    
    public class ShuffleClickEvent extends flash.events.Event
    {
        public function ShuffleClickEvent()
        {
            super(com.flash.mp3player.player.events.ShuffleClickEvent.SHUFFLE, true);
            return;
        }

        public static const SHUFFLE:String="shuffle";
    }
}
