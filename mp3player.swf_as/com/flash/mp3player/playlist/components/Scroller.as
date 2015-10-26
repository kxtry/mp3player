package com.flash.mp3player.playlist.components 
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    
    public class Scroller extends flash.display.Sprite
    {
        public function Scroller()
        {
            super();
            this.spBg = new ScrollerBgAsset();
            this.addChild(this.spBg);
            return;
        }

        public function Init(arg1:flash.display.Sprite):void
        {
            this.target = arg1;
            this.targetHeight = arg1.height;
            this.spBg.height = this.target.scrollRect.height;
            this.spTopArrow = new ScrollerTopArrowAsset();
            this.spTopArrow.useHandCursor = true;
            this.spTopArrow.buttonMode = true;
            this.spTopArrow.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.TopArrowPressHandler);
            this.spTopArrow.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.TopArrowReleaseHandler);
            this.addChild(this.spTopArrow);
            this.spHit = new flash.display.Sprite();
            this.spHit.graphics.beginFill(0, 0);
            this.spHit.graphics.drawRect(0, 0, this.spBg.width, this.spBg.height - 2 * this.spTopArrow.height);
            this.spHit.y = this.spTopArrow.y + this.spTopArrow.height;
            this.spHit.addEventListener(flash.events.MouseEvent.CLICK, this.BgClickHandler);
            this.addChild(this.spHit);
            this.spSlider = new com.flash.mp3player.playlist.components.ScrollerSlider();
            this.spSlider.Init(this.spHit.height * this.target.scrollRect.height / this.targetHeight);
            this.spSlider.y = this.spHit.y;
            this.spSlider.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.SliderStartDragHandler);
            this.addChild(this.spSlider);
            this.spBottomArrow = new ScrollerBotArrowAsset();
            this.spBottomArrow.useHandCursor = true;
            this.spBottomArrow.buttonMode = true;
            this.spBottomArrow.y = this.spBg.height - this.spBottomArrow.height;
            this.spBottomArrow.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.BottomArrowPressHandler);
            this.spBottomArrow.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.BottomArrowReleaseHandler);
            this.addChild(this.spBottomArrow);
            this.PositionElements();
            return;
        }

        private function PositionElements():void
        {
            this.spHit.y = this.spTopArrow.height;
            this.spTopArrow.x = (this.spBg.width - this.spTopArrow.width) / 2;
            this.spSlider.x = (this.spBg.width - this.spSlider.width) / 2;
            this.spSlider.y = this.spHit.y;
            this.spBottomArrow.x = (this.spBg.width - this.spBottomArrow.width) / 2;
            this.spBottomArrow.y = this.spBg.height - this.spBottomArrow.height;
            return;
        }

        private function SliderStartDragHandler(arg1:flash.events.MouseEvent):void
        {
            this.spSlider.startDrag(false, new flash.geom.Rectangle((this.spBg.width - this.spSlider.width) / 2, Math.round(this.spTopArrow.y + this.spTopArrow.height), 0, Math.round(this.spHit.height - this.spSlider.height)));
            this.stage.addEventListener(flash.events.MouseEvent.MOUSE_MOVE, this.StartMoveScrollHandler);
            this.stage.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.StopSliderDragHandler);
            return;
        }

        private function StartMoveScrollHandler(arg1:flash.events.MouseEvent):void
        {
            var loc1:*=this.target.scrollRect;
            loc1.y = Math.round((this.spSlider.y - this.spHit.y) / (this.spHit.height - this.spSlider.height) * (this.targetHeight - loc1.height));
            this.target.scrollRect = loc1;
            return;
        }

        private function StopSliderDragHandler(arg1:flash.events.MouseEvent):void
        {
            this.spSlider.stopDrag();
            this.stage.removeEventListener(flash.events.MouseEvent.MOUSE_MOVE, this.StartMoveScrollHandler);
            this.stage.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.StopSliderDragHandler);
            return;
        }

        private function TopArrowPressHandler(arg1:flash.events.MouseEvent):void
        {
            this.spTopArrow.addEventListener(flash.events.Event.ENTER_FRAME, this.StartScrollUpHandler);
            this.parent.stage.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.TopArrowReleaseHandler);
            return;
        }

        private function TopArrowReleaseHandler(arg1:flash.events.MouseEvent):void
        {
            this.spTopArrow.removeEventListener(flash.events.Event.ENTER_FRAME, this.StartScrollUpHandler);
            this.parent.stage.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.TopArrowReleaseHandler);
            return;
        }

        private function StartScrollUpHandler(arg1:flash.events.Event):void
        {
            var loc1:*=null;
            if (this.target.scrollRect.y > 0) 
            {
                loc1 = this.target.scrollRect;
                loc1.y = loc1.y - 5;
                if (loc1.y <= 0) 
                {
                    loc1.y = 0;
                }
                this.target.scrollRect = loc1;
                this.spSlider.y = Math.round(this.spHit.y + loc1.y * (this.spHit.height - this.spSlider.height) / (this.targetHeight - loc1.height));
            }
            return;
        }

        private function BgClickHandler(arg1:flash.events.MouseEvent):void
        {
            this.spSlider.y = this.mouseY - this.spSlider.height / 2;
            if (this.spSlider.y < this.spHit.y) 
            {
                this.spSlider.y = this.spHit.y;
            }
            else if (this.spSlider.y + this.spSlider.height > this.spHit.y + this.spHit.height) 
            {
                this.spSlider.y = this.spHit.y + this.spHit.height - this.spSlider.height;
            }
            var loc1:*=this.target.scrollRect;
            loc1.y = Math.round((this.spSlider.y - this.spHit.y) / (this.spHit.height - this.spSlider.height) * (this.targetHeight - this.target.scrollRect.height));
            this.target.scrollRect = loc1;
            return;
        }

        private function BottomArrowPressHandler(arg1:flash.events.MouseEvent):void
        {
            this.spBottomArrow.addEventListener(flash.events.Event.ENTER_FRAME, this.StartScrollDownHandler);
            this.parent.stage.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.BottomArrowReleaseHandler);
            return;
        }

        private function BottomArrowReleaseHandler(arg1:flash.events.MouseEvent):void
        {
            this.spBottomArrow.removeEventListener(flash.events.Event.ENTER_FRAME, this.StartScrollDownHandler);
            this.parent.stage.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.BottomArrowReleaseHandler);
            return;
        }

        private function StartScrollDownHandler(arg1:flash.events.Event):void
        {
            var loc1:*=null;
            if (this.target.scrollRect.y < this.targetHeight - this.target.scrollRect.height) 
            {
                loc1 = this.target.scrollRect;
                loc1.y = loc1.y + 5;
                if (loc1.y >= this.targetHeight) 
                {
                    loc1.y = this.targetHeight;
                }
                this.target.scrollRect = loc1;
                this.spSlider.y = Math.round(this.spHit.y + loc1.y * (this.spHit.height - this.spSlider.height) / (this.targetHeight - loc1.height));
            }
            return;
        }

        private var spBg:ScrollerBgAsset;

        private var spHit:flash.display.Sprite;

        private var spTopArrow:ScrollerTopArrowAsset;

        private var spSlider:com.flash.mp3player.playlist.components.ScrollerSlider;

        private var spBottomArrow:ScrollerBotArrowAsset;

        private var target:flash.display.Sprite;

        private var targetHeight:uint;
    }
}
