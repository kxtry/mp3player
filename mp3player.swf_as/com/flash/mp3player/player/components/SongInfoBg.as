package com.flash.mp3player.player.components 
{
    import com.flash.modules.utils.*;
    import flash.display.*;
    import flash.geom.*;
    
    public class SongInfoBg extends flash.display.Sprite
    {
        public function SongInfoBg()
        {
            super();
            return;
        }

        public function Init(arg1:uint):void
        {
            this.cacheAsBitmap = true;
            this.mouseEnabled = false;
            this.spSongInfoBgAsset = new SongInfoBgAsset();
            var loc1:*=com.flash.modules.utils.UBitmap.Resize(this.spSongInfoBgAsset, new flash.geom.Rectangle(13, 4, 366, 12), arg1, this.spSongInfoBgAsset.height);
            this.spSongInfoBg = new flash.display.Sprite();
            this.spSongInfoBg.addChild(loc1);
            this.addChild(this.spSongInfoBg);
            return;
        }

        private var spSongInfoBgAsset:SongInfoBgAsset;

        private var spSongInfoBg:flash.display.Sprite;
    }
}
