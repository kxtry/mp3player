package com.flash.mp3player.player.components 
{
    import com.flash.mp3player.player.events.*;
    import flash.display.*;
    import flash.events.*;
    
    public class PrevSongButton extends flash.display.Sprite
    {
        public function PrevSongButton()
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
            this.spPrev = new PrevButtonAsset();
            this.spPrev.x = (this.spBg.width - this.spPrev.width) / 2;
            this.spPrev.y = (this.spBg.height - this.spPrev.height) / 2;
            this.addChild(this.spPrev);
            return;
        }

        private function ClickHandler(arg1:flash.events.MouseEvent):void
        {
            this.dispatchEvent(new com.flash.mp3player.player.events.PrevClickEvent());
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

        private var spPrev:PrevButtonAsset;
    }
}
