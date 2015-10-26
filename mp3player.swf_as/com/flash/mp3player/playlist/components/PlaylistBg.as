package com.flash.mp3player.playlist.components 
{
    import com.flash.modules.utils.*;
    import flash.display.*;
    import flash.geom.*;
    
    public class PlaylistBg extends flash.display.Sprite
    {
        public function PlaylistBg()
        {
            super();
            return;
        }

        public function Init(arg1:uint, arg2:uint):void
        {
            this.cacheAsBitmap = true;
            this.mouseEnabled = false;
            this.spBgAsset = new PlaylistBgAsset();
            var loc1:*=com.flash.modules.utils.UBitmap.Resize(this.spBgAsset, new flash.geom.Rectangle(13, 9, 265, 164), arg1, arg2);
            this.spBg = new flash.display.Sprite();
            this.spBg.addChild(loc1);
            this.addChild(this.spBg);
            return;
        }

        private var spBgAsset:PlaylistBgAsset;

        private var spBg:flash.display.Sprite;
    }
}
