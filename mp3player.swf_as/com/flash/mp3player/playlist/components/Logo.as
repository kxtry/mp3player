package com.flash.mp3player.playlist.components 
{
    import com.flash.mp3player.playlist.events.*;
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    
    public class Logo extends flash.display.Sprite
    {
        public function Logo()
        {
            super();
            return;
        }

        public function Init(arg1:String, arg2:uint):void
        {
            var loc1:*=null;
            this.loaderWidth = arg2;
            this.cacheAsBitmap = true;
            this.useHandCursor = true;
            this.buttonMode = true;
            this.addEventListener(flash.events.MouseEvent.CLICK, this.ClickHandler);
            if (arg1 != "") 
            {
                loc1 = new flash.net.URLRequest(arg1);
                this.loader = new flash.display.Loader();
                this.loader.load(loc1);
                this.loader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, this.LoadCompleteHandler);
                this.loader.contentLoaderInfo.addEventListener(flash.events.IOErrorEvent.IO_ERROR, this.IOErrorHandler);
                this.addChild(this.loader);
            }
            return;
        }

        private function ClickHandler(arg1:flash.events.MouseEvent):void
        {
            this.dispatchEvent(new com.flash.mp3player.playlist.events.LogoClickEvent());
            return;
        }

        private function LoadCompleteHandler(arg1:flash.events.Event):void
        {
            if (this.loader.width > this.loaderWidth) 
            {
                this.loader.width = this.loaderWidth;
                this.loader.scaleY = this.loader.scaleX;
            }
            this.loader.x = (this.loaderWidth - this.loader.width) / 2;
            return;
        }

        private function IOErrorHandler(arg1:flash.events.IOErrorEvent):void
        {
            throw new Error("Logo image can\'t be read!");
        }

        private var loader:flash.display.Loader;

        private var loaderWidth:uint;
    }
}
