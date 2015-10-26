package com.flash.mp3player.playlist.events 
{
    import flash.display.*;
    import flash.events.*;
    
    public class ImageEvent extends flash.events.Event
    {
        public function ImageEvent(arg1:flash.display.Loader)
        {
            super(com.flash.mp3player.playlist.events.ImageEvent.IMAGE_LOADED);
            this.image = arg1;
            return;
        }

        public static const IMAGE_LOADED:String="imageLoaded";

        public var image:flash.display.Loader;
    }
}
