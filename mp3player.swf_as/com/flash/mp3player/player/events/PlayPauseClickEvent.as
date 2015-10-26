package com.flash.mp3player.player.events 
{
    import flash.events.*;
    
    public class PlayPauseClickEvent extends flash.events.Event
    {
        public function PlayPauseClickEvent()
        {
            super(com.flash.mp3player.player.events.PlayPauseClickEvent.PLAY_PAUSE_CLICK, true);
            return;
        }

        public static const PLAY_PAUSE_CLICK:String="playPauseClick";
    }
}
