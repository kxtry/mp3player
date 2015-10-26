package com.flash.mp3player.player.components 
{
    import com.flash.mp3player.player.events.*;
    import flash.display.*;
    import flash.events.*;
    
    public class NextSongButton extends flash.display.Sprite
    {
        public function NextSongButton()
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
            this.spNext = new NextButtonAsset();
            this.spNext.x = (this.spBg.width - this.spNext.width) / 2;
            this.spNext.y = (this.spBg.height - this.spNext.height) / 2;
            this.addChild(this.spNext);
            return;
        }

        private function ClickHandler(arg1:flash.events.MouseEvent):void
        {
            this.dispatchEvent(new com.flash.mp3player.player.events.NextClickEvent());
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

        private var spNext:NextButtonAsset;
    }
}
