package com.flash.mp3player.player.components 
{
    import com.flash.modules.utils.*;
    import flash.display.*;
    import flash.geom.*;
    
    public class PlayingProgressBg extends flash.display.Sprite
    {
        public function PlayingProgressBg()
        {
            super();
            return;
        }

        public function Init(arg1:uint):void
        {
            this.cacheAsBitmap = true;
            this.mouseEnabled = false;
            this.spBgAsset = new PlayingProgressBgAsset();
            var loc1:*=com.flash.modules.utils.UBitmap.Resize(this.spBgAsset, new flash.geom.Rectangle(4, 2, 380, 4), arg1, this.spBgAsset.height);
            this.spBg = new flash.display.Sprite();
            this.spBg.addChild(loc1);
            this.addChild(this.spBg);
            return;
        }

        private var spBgAsset:PlayingProgressBgAsset;

        private var spBg:flash.display.Sprite;
    }
}
