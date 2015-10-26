package com.flash.mp3player.playlist.components 
{
    import com.flash.modules.utils.*;
    import flash.display.*;
    import flash.geom.*;
    
    public class ScrollerSlider extends flash.display.Sprite
    {
        public function ScrollerSlider()
        {
            super();
            return;
        }

        public function Init(arg1:uint):void
        {
            this.cacheAsBitmap = true;
            this.useHandCursor = true;
            this.buttonMode = true;
            this.spBgAsset = new ScrollerSliderAsset();
            var loc1:*=com.flash.modules.utils.UBitmap.Resize(this.spBgAsset, new flash.geom.Rectangle(2, 7, 9, 4), this.spBgAsset.width, arg1);
            this.spBg = new flash.display.Sprite();
            this.spBg.addChild(loc1);
            this.addChild(this.spBg);
            return;
        }

        private var spBgAsset:ScrollerSliderAsset;

        private var spBg:flash.display.Sprite;
    }
}
