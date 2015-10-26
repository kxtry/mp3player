package com.flash.mp3player.player.events 
{
    import flash.events.*;
    
    public class NextPrevEvent extends flash.events.Event
    {
        public function NextPrevEvent(arg1:String)
        {
            super(arg1, true);
            return;
        }

        public static const NEXT:String="next";

        public static const PREV:String="prev";
    }
}
