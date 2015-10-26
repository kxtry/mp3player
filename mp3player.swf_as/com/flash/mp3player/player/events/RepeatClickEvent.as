package com.flash.mp3player.player.events 
{
    import flash.events.*;
    
    public class RepeatClickEvent extends flash.events.Event
    {
        public function RepeatClickEvent(arg1:Boolean)
        {
            super(com.flash.mp3player.player.events.RepeatClickEvent.REPEAT, true);
            this.repeat = arg1;
            return;
        }

        public static const REPEAT:String="repeat";

        public var repeat:Boolean;
    }
}
