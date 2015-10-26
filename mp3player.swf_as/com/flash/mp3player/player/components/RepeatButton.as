package com.flash.mp3player.player.components 
{
    import com.flash.mp3player.player.events.*;
    import flash.display.*;
    import flash.events.*;
    
    public class RepeatButton extends flash.display.Sprite
    {
        public function RepeatButton()
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
            this.spRepeatOn = new RepeatOnAsset();
            this.spRepeatOn.x = (this.spBg.width - this.spRepeatOn.width) / 2;
            this.spRepeatOn.y = (this.spBg.height - this.spRepeatOn.height) / 2;
            this.addChild(this.spRepeatOn);
            this.spRepeatOff = new RepeatOffAsset();
            this.spRepeatOff.visible = false;
            this.spRepeatOff.x = (this.spBg.width - this.spRepeatOff.width) / 2;
            this.spRepeatOff.y = (this.spBg.height - this.spRepeatOff.height) / 2;
            this.addChild(this.spRepeatOff);
            return;
        }

        public function TurnOn():void
        {
            this.spRepeatOff.visible = false;
            this.spRepeatOn.visible = true;
            return;
        }

        public function TurnOff():void
        {
            this.spRepeatOff.visible = true;
            this.spRepeatOn.visible = false;
            return;
        }

        private function ClickHandler(arg1:flash.events.MouseEvent):void
        {
            var loc1:*=false;
            if (this.spRepeatOff.visible) 
            {
                loc1 = true;
            }
            this.dispatchEvent(new com.flash.mp3player.player.events.RepeatClickEvent(loc1));
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

        private var spRepeatOn:RepeatOnAsset;

        private var spRepeatOff:RepeatOffAsset;
    }
}
