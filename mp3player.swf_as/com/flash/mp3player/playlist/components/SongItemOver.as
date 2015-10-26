package com.flash.mp3player.playlist.components 
{
    import com.flash.modules.utils.*;
    import flash.display.*;
    import flash.geom.*;
    
    public class SongItemOver extends flash.display.Sprite
    {
        public function SongItemOver()
        {
            super();
            return;
        }

        public function Init(arg1:uint):void
        {
            this.cacheAsBitmap = true;
            this.spBgAsset = new SongItemOverAsset();
            var loc1:*=com.flash.modules.utils.UBitmap.Resize(this.spBgAsset, new flash.geom.Rectangle(5, 4, 262, 9), arg1, this.spBgAsset.height);
            this.spBg = new flash.display.Sprite();
            this.spBg.addChild(loc1);
            this.addChild(this.spBg);
            return;
        }

        private var spBgAsset:SongItemOverAsset;

        private var spBg:flash.display.Sprite;
    }
}
