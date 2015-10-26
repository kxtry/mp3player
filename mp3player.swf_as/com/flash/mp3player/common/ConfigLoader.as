package com.flash.mp3player.common 
{
    import com.flash.mp3player.playlist.description.*;
    import flash.events.*;
    import flash.net.*;
    
    public class ConfigLoader extends flash.events.EventDispatcher
    {
        public function ConfigLoader()
        {
            super();
            return;
        }

        public function Load(arg1:String):void
        {
            var loc1:*=new flash.net.URLRequest(arg1);
            loc1.method = flash.net.URLRequestMethod.POST;
            var loc2:*=new flash.net.URLLoader(loc1);
            loc2.dataFormat = flash.net.URLLoaderDataFormat.TEXT;
            loc2.load(loc1);
            loc2.addEventListener(flash.events.Event.COMPLETE, this.CompleteHandler);
            loc2.addEventListener(flash.events.IOErrorEvent.IO_ERROR, this.IOErrorHandler);
            return;
        }

        private function CompleteHandler(arg1:flash.events.Event):void
        {
            var loc1:*=false;
            var loc3:*=null;
            var loc2:*=arg1.target as flash.net.URLLoader;
            if (loc2.data == null) 
            {
                throw new Error("XML is empty!");
            }
            else 
            {
                loc1 = true;
               // loc3 = new XML(unescape(loc2.data));
				loc3 = new XML(loc2.data);
            }
            this.dispatchEvent(new com.flash.mp3player.common.ConfigEvent(loc1, loc3));
            return;
        }

        private function IOErrorHandler(arg1:flash.events.IOErrorEvent):void
        {
            throw new Error("XML file can\'t be opened!");
        }

        public var settingsDesc:com.flash.mp3player.playlist.description.SettingsDesc;

        public var arSongs:Array;

        private var musicHolder:String="";
    }
}
