package com.flash.mp3player.player.components 
{
    import com.flash.mp3player.player.events.*;
    import flash.display.*;
    import flash.events.*;
    
    public class ShuffleButton extends flash.display.Sprite
    {
        public function ShuffleButton()
        {
            super();
            return;
        }

        public function Init():void
        {
            this.cacheAsBitmap = true;
            this.useHandCursor = true;
            this.buttonMode = true;
            this.addEventListener(flash.events.MouseEvent.CLICK, this.ClickHandler);
            this.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.OverHandler);
            this.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.OutHandler);
            this.spBg = new ButtonBgAsset();
            this.spBg.visible = false;
            this.addChild(this.spBg);
            this.spShuffleOff = new ShuffleOffAsset();
            this.spShuffleOff.x = (this.spBg.width - this.spShuffleOff.width) / 2;
            this.spShuffleOff.y = (this.spBg.height - this.spShuffleOff.height) / 2;
            this.addChild(this.spShuffleOff);
            this.spShuffleOn = new ShuffleOnAsset();
            this.spShuffleOn.visible = false;
            this.spShuffleOn.x = (this.spBg.width - this.spShuffleOn.width) / 2;
            this.spShuffleOn.y = (this.spBg.height - this.spShuffleOn.height) / 2;
            this.addChild(this.spShuffleOn);
            return;
        }

        private function ClickHandler(arg1:flash.events.MouseEvent):void
        {
            this.spShuffleOff.visible = !this.spShuffleOff.visible;
            this.spShuffleOn.visible = !this.spShuffleOn.visible;
            this.dispatchEvent(new com.flash.mp3player.player.events.ShuffleClickEvent());
            return;
        }

        private function OverHandler(arg1:flash.events.MouseEvent):void
        {
            this.spBg.visible = true;
            return;
        }

        private function OutHandler(arg1:flash.events.MouseEvent):void
        {
            this.spBg.visible = false;
            return;
        }

        private var spBg:ButtonBgAsset;

        private var spShuffleOff:ShuffleOffAsset;

        private var spShuffleOn:ShuffleOnAsset;
    }
}
