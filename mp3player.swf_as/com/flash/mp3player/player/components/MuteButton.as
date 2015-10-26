package com.flash.mp3player.player.components 
{
    import com.flash.mp3player.player.events.*;
    import flash.display.*;
    import flash.events.*;
    
    public class MuteButton extends flash.display.Sprite
    {
        public function MuteButton()
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
            this.spMuteOn = new MuteOnAsset();
            this.spMuteOn.visible = false;
            this.addChild(this.spMuteOn);
            this.spMuteOff = new MuteOffAsset();
            this.addChild(this.spMuteOff);
            return;
        }

        public function Mute():void
        {
            this.spMuteOn.visible = true;
            this.spMuteOff.visible = false;
            return;
        }

        public function Unmute():void
        {
            this.spMuteOn.visible = false;
            this.spMuteOff.visible = true;
            return;
        }

        private function ClickHandler(arg1:flash.events.MouseEvent):void
        {
            var loc1:*=false;
            if (this.spMuteOff.visible) 
            {
                loc1 = true;
            }
            this.dispatchEvent(new com.flash.mp3player.player.events.MuteClickEvent(loc1));
            return;
        }

        private var spMuteOn:MuteOnAsset;

        private var spMuteOff:MuteOffAsset;
    }
}
