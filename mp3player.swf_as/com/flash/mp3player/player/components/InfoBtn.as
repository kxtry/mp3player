package com.flash.mp3player.player.components 
{
    import flash.display.*;
    
    public class InfoBtn extends flash.display.Sprite
    {
        public function InfoBtn()
        {
            super();
            return;
        }

        public function Init():void
        {
            this.cacheAsBitmap = true;
            this.useHandCursor = true;
            this.buttonMode = true;
            this.spBg = new InfoBtnAsset();
            this.addChild(this.spBg);
            return;
        }

        private var spBg:InfoBtnAsset;
    }
}
