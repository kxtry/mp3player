package com.flash.mp3player.playlist.components 
{
    import com.flash.modules.utils.*;
    import flash.display.*;
    import flash.geom.*;
    
    public class SongItemSelected extends flash.display.Sprite
    {
        public function SongItemSelected()
        {
            super();
            return;
        }

        public function Init(arg1:uint):void
        {
            this.cacheAsBitmap = true;
            this.spBgAsset = new SongItemSelectedAsset();
            var loc1:*=com.flash.modules.utils.UBitmap.Resize(this.spBgAsset, new flash.geom.Rectangle(5, 4, 262, 9), arg1, this.spBgAsset.height);
            this.spBg = new flash.display.Sprite();
            this.spBg.addChild(loc1);
            this.addChild(this.spBg);
            return;
        }

        private var spBgAsset:SongItemSelectedAsset;

        private var spBg:flash.display.Sprite;
    }
}
