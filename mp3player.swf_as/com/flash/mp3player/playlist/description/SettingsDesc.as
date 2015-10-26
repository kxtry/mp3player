package com.flash.mp3player.playlist.description 
{
    public class SettingsDesc extends Object
    {
        public function SettingsDesc(arg1:XML)
        {
            super();
            this.musicFolder = String(arg1.musicFolder);
            this.picFolder = String(arg1.picturesFolder);
            if (!(String(arg1.showPlaylist).length == 0) && !(String(arg1.showPlaylist) == "true")) 
            {
                this.showPlaylist = false;
            }
            this.coverDesc = new CoverDesc(arg1.defaultCover[0]);
            this.logoDesc = new LogoDesc(arg1.logo[0]);
            this.btnDesc = new ButtonDesc(arg1.button[0]);
            return;
        }

        public var musicFolder:String="";

        public var picFolder:String="";

        public var showPlaylist:Boolean=true;

        public var coverDesc:CoverDesc;

        public var logoDesc:LogoDesc;

        public var btnDesc:ButtonDesc;
    }
}
