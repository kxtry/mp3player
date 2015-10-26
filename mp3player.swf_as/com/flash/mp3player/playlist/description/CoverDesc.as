package com.flash.mp3player.playlist.description 
{
    internal class CoverDesc extends Object
    {
        public function CoverDesc(arg1:XML)
        {
            super();
            if (!(String(arg1.show).length == 0) && !(String(arg1.show) == "true")) 
            {
                this.show = false;
            }
            if (String(arg1.width).length != 0) 
            {
                this.width = uint(arg1.width);
            }
            if (String(arg1.imageURL).length != 0) 
            {
                this.imageURL = String(arg1.imageURL);
            }
            return;
        }

        public var show:Boolean=true;

        public var width:uint=100;

        public var imageURL:String="";
    }
}
