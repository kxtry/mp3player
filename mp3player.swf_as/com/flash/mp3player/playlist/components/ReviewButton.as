package com.flash.mp3player.playlist.components 
{
    import com.flash.modules.text.*;
    import com.flash.modules.utils.*;
    import com.flash.mp3player.playlist.events.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    
    public class ReviewButton extends flash.display.Sprite
    {
        public function ReviewButton()
        {
            super();
            return;
        }

        public function Init(arg1:String, arg2:uint):void
        {
            this.cacheAsBitmap = true;
            this.useHandCursor = true;
            this.buttonMode = true;
            this.addEventListener(flash.events.MouseEvent.CLICK, this.ClickHandler);
            this.spBtnAsset = new ColumnButtonAsset();
            this.spBtn = new flash.display.Sprite();
            this.addChild(this.spBtn);
            this.tfText = new com.flash.modules.text.Text("tfText", arg1, "Tahoma", 10, 16777215, "left", "dynamic", false, false, true, true, "center");
            this.tfText.mouseEnabled = false;
            this.tfText.x = this.border;
            this.tfText.y = this.border;
            this.tfText.width = arg2 - 2 * this.border;
            this.tfText.height = this.tfText.textHeight + 4;
            this.addChild(this.tfText);
            var loc1:*=com.flash.modules.utils.UBitmap.Resize(this.spBtnAsset, new flash.geom.Rectangle(4, 12, 93, 7), arg2, this.tfText.height + 2 * this.border);
            this.spBtn.addChild(loc1);
            return;
        }

        private function ClickHandler(arg1:flash.events.MouseEvent):void
        {
            this.dispatchEvent(new com.flash.mp3player.playlist.events.ReviewClickEvent());
            return;
        }

        private const border:uint=3;

        private var spBtnAsset:ColumnButtonAsset;

        private var spBtn:flash.display.Sprite;

        private var tfText:com.flash.modules.text.Text;
    }
}
