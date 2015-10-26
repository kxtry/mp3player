package com.flash.mp3player.playlist.description 
{
    internal class ButtonDesc extends Object
    {
        public function ButtonDesc(arg1:XML)
        {
            super();
            if (!(String(arg1.show).length == 0) && !(String(arg1.show) == "true")) 
            {
                this.show = false;
            }
            if (String(arg1.text).length != 0) 
            {
                this.text = String(arg1.text);
            }
            if (String(arg1.href).length != 0) 
            {
                this.href = String(arg1.href);
            }
            return;
        }

        public var show:Boolean=true;

        public var text:String="";

        public var href:String="";
    }
}
