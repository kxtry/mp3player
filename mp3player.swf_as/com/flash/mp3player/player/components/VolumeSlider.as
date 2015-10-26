package com.flash.mp3player.player.components 
{
    import com.flash.mp3player.player.events.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    
    public class VolumeSlider extends flash.display.Sprite
    {
        public function VolumeSlider()
        {
            super();
            return;
        }

        public function Init():void
        {
            this.spBg = new VolumeBgAsset();
            this.spBg.useHandCursor = true;
            this.spBg.buttonMode = true;
            this.spBg.addEventListener(flash.events.MouseEvent.CLICK, this.SliderClickHandler);
            this.addChild(this.spBg);
            this.spSlider = new VolumeSliderAsset();
            this.spSlider.mouseEnabled = false;
            this.spSlider.x = 1;
            this.spSlider.y = 2;
            this.spSlider.width = this.spBg.width - 2 * this.spSlider.x;
            this.addChild(this.spSlider);
            this.spPointer = new VolumePointerAsset();
            this.spPointer.useHandCursor = true;
            this.spPointer.buttonMode = true;
            this.spPointer.x = this.spBg.width - this.spPointer.width;
            this.spPointer.y = Math.round((this.spBg.height - this.spPointer.height) / 2);
            this.spPointer.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.SliderDownHandler);
            this.addChild(this.spPointer);
            return;
        }

        public function SetVolume(arg1:Number):void
        {
            this.spPointer.x = arg1 * (this.spBg.width - this.spPointer.width);
            this.spSlider.width = this.spPointer.x;
            return;
        }

        private function SliderClickHandler(arg1:flash.events.MouseEvent):void
        {
            this.spPointer.x = this.mouseX - this.spPointer.width / 2;
            if (this.spPointer.x + this.spPointer.width > this.spBg.width) 
            {
                this.spPointer.x = this.spBg.width - this.spPointer.width;
            }
            this.spSlider.width = this.spPointer.x;
            this.volume = this.mouseX / (this.spBg.width - this.spPointer.width);
            this.dispatchEvent(new com.flash.mp3player.player.events.VolumeEvent(this.volume));
            return;
        }

        private function SliderDownHandler(arg1:flash.events.MouseEvent):void
        {
            this.stage.addEventListener(flash.events.MouseEvent.MOUSE_MOVE, this.SliderMoveHandler);
            this.stage.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.SliderUpHandler);
            var loc1:*=new flash.geom.Rectangle(this.spBg.x, this.spPointer.y, this.spBg.width - this.spPointer.width, 0);
            this.spPointer.startDrag(false, loc1);
            return;
        }

        private function SliderMoveHandler(arg1:flash.events.MouseEvent):void
        {
            this.volume = this.spPointer.x / (this.spBg.width - this.spPointer.width);
            this.spSlider.width = this.spPointer.x;
            this.dispatchEvent(new com.flash.mp3player.player.events.VolumeEvent(this.volume));
            return;
        }

        private function SliderUpHandler(arg1:flash.events.MouseEvent):void
        {
            this.spPointer.stopDrag();
            this.stage.removeEventListener(flash.events.MouseEvent.MOUSE_MOVE, this.SliderMoveHandler);
            this.stage.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.SliderUpHandler);
            return;
        }

        private var spBg:VolumeBgAsset;

        private var spSlider:VolumeSliderAsset;

        private var spPointer:VolumePointerAsset;

        private var volume:Number;
    }
}
