package com.flash.mp3player.player.components 
{
    import flash.display.*;
    
    public class SongPlayingProgress extends flash.display.Sprite
    {
        public function SongPlayingProgress()
        {
            super();
            return;
        }

        public function Init():void
        {
            this.cacheAsBitmap = true;
            this.mouseEnabled = false;
            this.spProgress = new flash.display.Sprite();
            this.spProgress.mouseEnabled = false;
            this.addChild(this.spProgress);
            return;
        }

        public function Draw(arg1:uint):void
        {
            this.spProgress.graphics.clear();
            this.spProgress.graphics.lineStyle(1, 1226722);
            this.spProgress.graphics.beginFill(614519, 0.5);
            this.spProgress.graphics.drawRect(0, 0, arg1, 3);
            return;
        }

        private var spProgress:flash.display.Sprite;
    }
}
