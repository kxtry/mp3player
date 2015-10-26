package com.flash.mp3player.player.components 
{
    import com.flash.mp3player.player.events.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    
    public class ProgressSlider extends flash.display.Sprite
    {
        public function ProgressSlider()
        {
            super();
            return;
        }

        public function Init(arg1:uint):void
        {
            this.cacheAsBitmap = true;
            this.spProgressBg = new com.flash.mp3player.player.components.PlayingProgressBg();
            this.spProgressBg.Init(arg1);
            this.addChild(this.spProgressBg);
            this.spSongLoadingProgress = new com.flash.mp3player.player.components.SongLoadingProgress();
            this.spSongLoadingProgress.Init();
            this.spSongLoadingProgress.x = 1;
            this.spSongLoadingProgress.y = 2;
            this.spSongLoadingProgress.addEventListener(flash.events.MouseEvent.CLICK, this.SeekClickHandler);
            this.addChild(this.spSongLoadingProgress);
            this.spSongPlayingProgress = new com.flash.mp3player.player.components.SongPlayingProgress();
            this.spSongPlayingProgress.Init();
            this.spSongPlayingProgress.x = 1;
            this.spSongPlayingProgress.y = 2;
            this.addChild(this.spSongPlayingProgress);
            this.seekPointer = new SeekPointerAsset();
            this.seekPointer.useHandCursor = true;
            this.seekPointer.buttonMode = true;
            this.seekPointer.y = Math.round((this.spProgressBg.height - this.seekPointer.height) / 2);
            this.seekPointer.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, this.PointerDownHandler);
            this.addChild(this.seekPointer);
            return;
        }

        public function ShowLoadingProgress(arg1:Number):void
        {
            this.spSongLoadingProgress.Draw(arg1 * (this.spProgressBg.width - 2));
            return;
        }

        public function ShowPlayingProgress(arg1:Number):void
        {
            if (arg1 > 1) 
            {
                arg1 = 1;
            }
            var loc1:*=arg1 * (this.spProgressBg.width - 2);
            this.spSongPlayingProgress.Draw(loc1);
            this.seekPointer.x = Math.round(arg1 * (this.spProgressBg.width - this.seekPointer.width));
            return;
        }

        public function ShowProgressBar(arg1:Boolean):void
        {
            this.spSongLoadingProgress.useHandCursor = arg1;
            this.spSongLoadingProgress.buttonMode = arg1;
            this.spSongLoadingProgress.mouseEnabled = arg1;
            this.spSongPlayingProgress.visible = arg1;
            this.seekPointer.visible = arg1;
            return;
        }

        private function PointerDownHandler(arg1:flash.events.MouseEvent):void
        {
            this.stage.addEventListener(flash.events.MouseEvent.MOUSE_MOVE, this.PointerMoveHandler);
            this.stage.addEventListener(flash.events.MouseEvent.MOUSE_UP, this.PointerUpHandler);
            var loc1:*=new flash.geom.Rectangle(0, this.seekPointer.y, this.spProgressBg.width - this.seekPointer.width, 0);
            this.seekPointer.startDrag(false, loc1);
            return;
        }

        private function PointerUpHandler(arg1:flash.events.MouseEvent):void
        {
            this.seekPointer.stopDrag();
            this.stage.removeEventListener(flash.events.MouseEvent.MOUSE_MOVE, this.PointerMoveHandler);
            this.stage.removeEventListener(flash.events.MouseEvent.MOUSE_UP, this.PointerUpHandler);
            return;
        }

        private function PointerMoveHandler(arg1:flash.events.MouseEvent):void
        {
            var loc1:*=this.seekPointer.x / (this.spProgressBg.width - this.seekPointer.width);
            this.dispatchEvent(new com.flash.mp3player.player.events.SeekEvent(loc1));
            return;
        }

        private function SeekClickHandler(arg1:flash.events.MouseEvent):void
        {
            var loc1:*=NaN;
            if (this.spSongLoadingProgress.mouseEnabled) 
            {
                loc1 = this.spProgressBg.mouseX / this.spProgressBg.width;
                this.dispatchEvent(new com.flash.mp3player.player.events.SeekEvent(loc1));
            }
            return;
        }

        private var spProgressBg:com.flash.mp3player.player.components.PlayingProgressBg;

        private var spSongLoadingProgress:com.flash.mp3player.player.components.SongLoadingProgress;

        private var spSongPlayingProgress:com.flash.mp3player.player.components.SongPlayingProgress;

        private var seekPointer:SeekPointerAsset;
    }
}
