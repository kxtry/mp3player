package com.flash.mp3player.playlist.events 
{
    import flash.events.*;
    
    public class ReviewClickEvent extends flash.events.Event
    {
        public function ReviewClickEvent()
        {
            super(com.flash.mp3player.playlist.events.ReviewClickEvent.REVIEW_SHOW, true);
            return;
        }

        public static const REVIEW_SHOW:String="reviewShow";
    }
}
