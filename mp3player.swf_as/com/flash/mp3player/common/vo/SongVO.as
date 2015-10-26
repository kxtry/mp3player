package com.flash.mp3player.common.vo 
{
    public class SongVO extends Object
    {
        public function SongVO()
        {
            super();
            return;
        }

        public function toString():String
        {
            return "SongVO url = " + this.url;
        }

        public var artist:String="";

        public var title:String="";

        public var length:Number=0;

        public var url:String="";

        public var uid:String="";

        public var cover:String="";

        public var coverLoaded:Boolean=false;
    }
}
