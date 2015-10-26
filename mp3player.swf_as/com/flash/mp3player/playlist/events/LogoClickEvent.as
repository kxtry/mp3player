package com.flash.mp3player.playlist.events 
{
    import flash.events.*;
    
    public class LogoClickEvent extends flash.events.Event
    {
        public function LogoClickEvent()
        {
            super(com.flash.mp3player.playlist.events.LogoClickEvent.GOTOURL, true);
            return;
        }

        public static const GOTOURL:String="gotoURL";
    }
}
