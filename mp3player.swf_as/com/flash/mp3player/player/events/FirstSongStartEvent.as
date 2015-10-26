package com.flash.mp3player.player.events 
{
    import flash.events.*;
    
    public class FirstSongStartEvent extends flash.events.Event
    {
        public function FirstSongStartEvent()
        {
            super(com.flash.mp3player.player.events.FirstSongStartEvent.START, true);
            return;
        }

        public static const START:String="start";
    }
}
