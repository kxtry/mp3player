package com.flash.mp3player.playlist.components 
{
    import flash.display.*;
    
    public class AlbumCover extends flash.display.Sprite
    {
        public function AlbumCover()
        {
            super();
            return;
        }

        public function Init(arg1:uint):void
        {
            this.coverWidth = arg1;
            this.spImageContainer = new flash.display.Sprite();
            this.addChild(this.spImageContainer);
            this.spBorder = new flash.display.Sprite();
            this.addChild(this.spBorder);
            return;
        }

        public function AttachCover(arg1:flash.display.Loader):void
        {
            var loc1:*=this.coverWidth - this.borderThickness * 2;
            if (arg1.width > loc1) 
            {
                arg1.width = loc1;
                arg1.scaleY = arg1.scaleX;
            }
            this.spImageContainer.x = Math.round((this.coverWidth - arg1.width) / 2);
            this.spImageContainer.addChild(arg1);
            this.spBorder.graphics.clear();
            this.DrawBorder(this.spBorder.graphics);
            return;
        }

        public function ShowCover(arg1:String):void
        {
            var loc2:*=null;
            var loc1:*=0;
            while (loc1 < this.spImageContainer.numChildren) 
            {
                loc2 = this.spImageContainer.getChildAt(loc1);
                loc2.visible = loc2.name == arg1;
                ++loc1;
            }
            return;
        }

        private function DrawBorder(arg1:flash.display.Graphics):void
        {
            arg1.beginFill(0, 0);
            arg1.lineStyle(this.borderThickness, 13619151, 0.3);
            arg1.drawRect(this.spImageContainer.x, 0, this.spImageContainer.width, this.spImageContainer.height);
            arg1.endFill();
            return;
        }

        private var coverWidth:uint;

        private var borderThickness:uint=1;

        private var spImageContainer:flash.display.Sprite;

        private var spBorder:flash.display.Sprite;
    }
}
