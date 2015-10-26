package com.flash.mp3player.player.components 
{
    import com.flash.mp3player.player.events.*;
    import flash.display.*;
    import flash.events.*;
    
    public class PlayPauseButton extends flash.display.Sprite
    {
        public function PlayPauseButton()
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
            this.spPlay = new PlayButtonAsset();
            this.spPlay.x = (this.spBg.width - this.spPlay.width) / 2;
            this.spPlay.y = (this.spBg.height - this.spPlay.height) / 2;
            this.addChild(this.spPlay);
            this.spPause = new PauseButtonAsset();
            this.spPause.visible = false;
            this.spPause.x = (this.spBg.width - this.spPause.width) / 2;
            this.spPause.y = (this.spBg.height - this.spPause.height) / 2;
            this.addChild(this.spPause);
            return;
        }

        public function Play():void
        {
            this.spPlay.visible = false;
            this.spPause.visible = true;
            return;
        }

        public function Pause():void
        {
            this.spPlay.visible = true;
            this.spPause.visible = false;
            return;
        }

        private function ClickHandler(arg1:flash.events.MouseEvent):void
        {
            this.dispatchEvent(new com.flash.mp3player.player.events.PlayPauseClickEvent());
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

        private var spPlay:PlayButtonAsset;

        private var spPause:PauseButtonAsset;
    }
}
