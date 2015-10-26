package com.flash.mp3player.player.components 
{
    import com.flash.modules.text.*;
    import flash.display.*;
    
    public class SplashScreen extends flash.display.Sprite
    {
        public function SplashScreen()
        {
            super();
            return;
        }

        public function Init(arg1:flash.display.DisplayObjectContainer):void
        {
            this.cacheAsBitmap = true;
            this.spBg = new flash.display.Sprite();
            this.spBg.graphics.beginFill(16777215, 0.5);
            this.spBg.graphics.drawRect(0, 0, arg1.stage.stageWidth, arg1.stage.stageHeight);
            this.addChild(this.spBg);
            this.tfText = new com.flash.modules.text.Text("tfLoading", "Loading playlist...", "Tahoma", 11, 0, "none", "dynamic", false, false, false, false, "center");
            this.tfText.mouseEnabled = false;
            this.tfText.width = arg1.stage.stageWidth;
            this.tfText.height = this.tfText.textHeight + 5;
            this.tfText.y = (arg1.stage.stageHeight - this.tfText.height) / 2;
            this.addChild(this.tfText);
            return;
        }

        private var spBg:flash.display.Sprite;

        private var tfText:com.flash.modules.text.Text;
    }
}
