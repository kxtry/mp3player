package com.flash.mp3player.player.components 
{
    import flash.display.*;
    
    public class SongLoadingProgress extends flash.display.Sprite
    {
        public function SongLoadingProgress()
        {
            super();
            return;
        }

        public function Init():void
        {
            this.cacheAsBitmap = true;
            this.useHandCursor = true;
            this.buttonMode = true;
            this.spProgress = new flash.display.Sprite();
            this.addChild(this.spProgress);
            return;
        }

        public function Draw(arg1:uint):void
        {
            this.spProgress.graphics.clear();
            this.spProgress.graphics.lineStyle(1, 16777215, 0.6);
            this.spProgress.graphics.beginFill(3355443, 0.75);
            this.spProgress.graphics.drawRoundRect(0, 0, arg1, 3, 2, 2);
            return;
        }

        private var spProgress:flash.display.Sprite;
    }
}
