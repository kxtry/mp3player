package com.flash.mp3player.playlist.components 
{
    import com.flash.modules.text.*;
    import com.flash.modules.utils.*;
    import com.flash.mp3player.common.vo.*;
    import com.flash.mp3player.playlist.events.*;
    import flash.display.*;
    import flash.events.*;
    
    public class SongItem extends flash.display.Sprite
    {
		var songItemWidth: uint;
        public function SongItem()
        {
            super();
            return;
        }

        public function Init(arg1:uint, arg2:com.flash.mp3player.common.vo.SongVO):void
        {
            this.cacheAsBitmap = true;
            this.useHandCursor = true;
            this.buttonMode = true;
            this.doubleClickEnabled = true;
            this.songVO = arg2;
			this.songItemWidth = arg1;
            this.name = String(this.songVO.uid);
            this.spSongOver = new com.flash.mp3player.playlist.components.SongItemOver();
            this.spSongOver.Init(arg1);
            this.spSongOver.visible = false;
            this.addChild(this.spSongOver);
            this.spSongSelected = new com.flash.mp3player.playlist.components.SongItemSelected();
            this.spSongSelected.Init(arg1);
            this.spSongSelected.visible = false;
            this.addChild(this.spSongSelected);
            this.spSongOut = new flash.display.Sprite();
            this.spSongOut.graphics.beginFill(0, 0);
            this.spSongOut.graphics.drawRect(0, 0, arg1, this.spSongOver.height);
            this.addChild(this.spSongOut);
            var loc1:*=this.songVO.uid + ". " + this.songVO.artist + " - " + this.songVO.title;
            this.tfLabel = new com.flash.modules.text.Text("tfLabel", loc1);
            this.tfLabel.mouseEnabled = false;
            this.tfLabel.width = arg1 - 40;
            this.tfLabel.height = this.tfLabel.textHeight + 5;
            this.tfLabel.x = 3;
            this.tfLabel.y = (this.spSongOver.height - this.tfLabel.height) / 2;
            this.addChild(this.tfLabel);
            this.tfTime = new com.flash.modules.text.Text("tfTime", com.flash.modules.utils.UDateTime.ConvertToMinutesStr(this.songVO.length));
            if (this.tfTime.text == "00:00") 
            {
                this.tfTime.text = "--:--";
            }
			this.tfTime.text = ""
            this.tfTime.mouseEnabled = false;
            this.tfTime.width = this.tfTime.textWidth + 7;
            this.tfTime.height = this.tfTime.textHeight + 5;
            this.tfTime.x = arg1 - this.tfTime.width;
            this.tfTime.y = (this.spSongOver.height - this.tfTime.height) / 2;
            this.addChild(this.tfTime);
            this.addEventListener(flash.events.MouseEvent.CLICK, this.SongDoubleClickHandler);
            this.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.MouseOverHandler);
            this.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.MouseOutHandler);
            return;
        }

        public function Update(arg1:com.flash.mp3player.common.vo.SongVO):void
        {
			var tm:String;
			tm = com.flash.modules.utils.UDateTime.ConvertToMinutesStr(this.songVO.length);
            this.songVO = arg1;
            this.tfLabel.text = this.songVO.uid + ". " + this.songVO.artist + " - " + this.songVO.title;
			this.tfTime.text = tm
			this.tfTime.width = this.tfTime.textWidth + 7;
            this.tfTime.height = this.tfTime.textHeight + 5;
            this.tfTime.x = this.songItemWidth - this.tfTime.width;
            this.tfTime.y = (this.spSongOver.height - this.tfTime.height) / 2;
			return;
			this.tfTime.graphics.clear();
            this.tfTime.graphics.lineStyle(1, 1226722);
            this.tfTime.graphics.beginFill(614519, 0.5);
            this.tfTime.graphics.drawRect(0, 0, arg1, 3);
            return;
        }

        public function Select():void
        {
            this.spSongSelected.visible = true;
            this.spSongOut.visible = true;
            this.spSongOver.visible = false;
            return;
        }

        public function Deselect():void
        {
            this.spSongSelected.visible = false;
            return;
        }

        private function MouseOverHandler(arg1:flash.events.MouseEvent):void
        {
            if (!this.spSongSelected.visible) 
            {
                this.spSongOver.visible = true;
                this.spSongOut.visible = false;
            }
            return;
        }

        private function MouseOutHandler(arg1:flash.events.MouseEvent):void
        {
            if (!this.spSongSelected.visible) 
            {
                this.spSongOver.visible = false;
                this.spSongOut.visible = true;
            }
            return;
        }

        private function SongDoubleClickHandler(arg1:flash.events.MouseEvent):void
        {
            this.dispatchEvent(new com.flash.mp3player.playlist.events.SongClickEvent(this.songVO));
            return;
        }

        public static const ITEM_HEIGHT:uint=17;

        private var spSongOut:flash.display.Sprite;

        private var spSongOver:com.flash.mp3player.playlist.components.SongItemOver;

        private var spSongSelected:com.flash.mp3player.playlist.components.SongItemSelected;

        private var tfLabel:com.flash.modules.text.Text;

        private var tfTime:com.flash.modules.text.Text;

        private var songVO:com.flash.mp3player.common.vo.SongVO;
    }
}
