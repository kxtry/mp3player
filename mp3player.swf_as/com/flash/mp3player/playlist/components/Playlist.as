package com.flash.mp3player.playlist.components 
{
    import com.flash.mp3player.common.vo.*;
    import flash.display.*;
    import flash.geom.*;
    
    public class Playlist extends flash.display.Sprite
    {
		var cache_loc:com.flash.mp3player.playlist.components.SongItem;
        public function Playlist()
        {
            super();
            return;
        }

        public function Init(arg1:uint, arg2:uint, arg3:Array):void
        {
            trace(arg2);
            this.spBg = new com.flash.mp3player.playlist.components.PlaylistBg();
            this.spBg.Init(arg1, arg2);
            this.addChild(this.spBg);
            this.songsContainer = new flash.display.Sprite();
            this.songsContainer.x = this.border;
            this.songsContainer.y = this.border;
            this.addChild(this.songsContainer);
			this.cache_loc = null;
            var loc1:*=0;
            var loc2:*=arg1 - 2 * this.border;
            if (arg3.length * com.flash.mp3player.playlist.components.SongItem.ITEM_HEIGHT >= arg2 - 2 * this.border - 1) 
            {
                this.scroller = new com.flash.mp3player.playlist.components.Scroller();
                loc2 = loc2 - this.scroller.width;
            }
            var loc3:*=0;
            while (loc3 < arg3.length) 
            {
                this.songItem = new com.flash.mp3player.playlist.components.SongItem();
                this.songItem.Init(loc2, arg3[loc3]);
                this.songItem.y = loc1;
                this.songsContainer.addChild(this.songItem);
                loc1 = loc1 + this.songItem.height;
                ++loc3;
            }
            if (arg3.length * com.flash.mp3player.playlist.components.SongItem.ITEM_HEIGHT >= arg2 - 2 * this.border - 1) 
            {
                this.songsContainer.scrollRect = new flash.geom.Rectangle(0, 0, arg1, arg2 - 2 * this.border - 1);
                this.scroller.Init(this.songsContainer);
                this.scroller.x = loc2 + this.border + 1;
                this.scroller.y = this.border;
                this.addChild(this.scroller);
            }
            return;
        }

        public function SelectSongItem(arg1:String):void
        {
            var loc1:*=0;
            var loc2:*=null;
            while (loc1 < this.songsContainer.numChildren) 
            {
                loc2 = this.songsContainer.getChildAt(loc1) as com.flash.mp3player.playlist.components.SongItem;
                if (loc2.name != arg1) 
                {
                    loc2.Deselect();
                }
                else 
                {
                    loc2.Select();
                }
                ++loc1;
            }
            return;
        }

        public function UpdateSongItem(arg1:com.flash.mp3player.common.vo.SongVO):void
        {
            var loc1:*=0;
            var loc2:*=null;
			if (this.cache_loc && this.cache_loc.name == arg1.uid)
			{
				this.cache_loc.Update(arg1);
				return;
			}
            while (loc1 < this.songsContainer.numChildren) 
            {
                loc2 = this.songsContainer.getChildAt(loc1) as com.flash.mp3player.playlist.components.SongItem;
                if (loc2.name == arg1.uid) 
                {
					this.cache_loc = loc2;
                    loc2.Update(arg1);
					return;
                }
                ++loc1;
            }
            return;
        }

        private const border:uint=8;

        private var songsContainer:flash.display.Sprite;

        private var spBg:com.flash.mp3player.playlist.components.PlaylistBg;

        private var scroller:com.flash.mp3player.playlist.components.Scroller;

        private var songItem:com.flash.mp3player.playlist.components.SongItem;
    }
}
