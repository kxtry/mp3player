package com.flash.mp3player.playlist.loader 
{
    import com.flash.mp3player.playlist.events.*;
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    
    public class ImageLoader extends flash.events.EventDispatcher
    {
        public function ImageLoader()
        {
            super();
            return;
        }

        public function Load(arg1:String, arg2:String="0"):void
        {
            var loc1:*=new flash.display.Loader();
            loc1.name = arg2;
            loc1.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, this.LoadCompleteHandler);
            loc1.contentLoaderInfo.addEventListener(flash.events.IOErrorEvent.IO_ERROR, this.IOErrorHandler);
            loc1.load(new flash.net.URLRequest(arg1));
            return;
        }

        private function LoadCompleteHandler(arg1:flash.events.Event):void
        {
            var loc1:*=flash.display.Loader(arg1.target.loader);
            this.dispatchEvent(new com.flash.mp3player.playlist.events.ImageEvent(loc1));
            return;
        }

        private function IOErrorHandler(arg1:flash.events.IOErrorEvent):void
        {
            throw new Error("Error occured during image loading.");
        }
    }
}
