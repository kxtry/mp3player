package com.flash.mp3player.playlist.description 
{
    internal class LogoDesc extends Object
    {
        public function LogoDesc(arg1:XML)
        {
            super();
            if (!(String(arg1.show).length == 0) && !(String(arg1.show).toLocaleLowerCase() == "true")) 
            {
                this.show = false;
            }
            if (String(arg1.imageURL).length != 0) 
            {
                this.imageURL = String(arg1.imageURL);
            }
            if (String(arg1.href).length != 0) 
            {
                this.href = String(arg1.href);
            }
            return;
        }

        public var show:Boolean=true;

        public var imageURL:String="";

        public var href:String="";
    }
}
