package com.flash.mp3player.playlist 
{
    import com.flash.mp3player.common.*;
    import com.flash.mp3player.common.vo.*;
    import com.flash.mp3player.playlist.components.*;
    import flash.display.*;
    
    public class PlaylistView extends flash.display.Sprite
    {
        public function PlaylistView()
        {
            super();
            return;
        }

        public function DrawPlaylist(arg1:Array, arg2:uint, arg3:uint=0, arg4:Boolean=true, arg5:Boolean=true, arg6:Boolean=true, arg7:String="", arg8:String=""):void
        {
            var loc1:*=Math.max(this.stage.stageWidth, com.flash.mp3player.common.CommonModel.MIN_APP_WIDTH);
            var loc2:*=Math.max(this.stage.stageHeight, com.flash.mp3player.common.CommonModel.MIN_APP_HEIGHT);
            if (arg4 == false && arg5 == false && arg6 == false) 
            {
                arg3 = 0;
            }
            else 
            {
                this.spBg = new com.flash.mp3player.playlist.components.LeftColumn();
                this.spBg.Init(arg3, loc2 - arg2);
                this.addChild(this.spBg);
            }
            this.cover = new com.flash.mp3player.playlist.components.AlbumCover();
            if (arg4) 
            {
                this.cover.Init(arg3 - 2 * this.border);
                this.cover.x = this.border;
                this.cover.y = this.border;
                this.addChild(this.cover);
            }
            this.btnReview = new com.flash.mp3player.playlist.components.ReviewButton();
            if (arg5) 
            {
                this.btnReview.Init(arg8, arg3 - 2 * this.border);
                this.btnReview.x = this.border;
                this.addChild(this.btnReview);
            }
            this.logo = new com.flash.mp3player.playlist.components.Logo();
            if (arg6) 
            {
                this.logo.Init(arg7, arg3 - 2 * this.border);
                this.logo.x = this.border;
                this.addChild(this.logo);
            }
            this.playlist = new com.flash.mp3player.playlist.components.Playlist();
            this.playlist.Init(loc1 - arg3 + 1, loc2 - arg2, arg1);
            this.playlist.x = arg3 - 1;
            this.addChild(this.playlist);
            this.PositionElements();
            return;
        }

        public function UpdatePlaylist(arg1:com.flash.mp3player.common.vo.SongVO):void
        {
            if (this.playlist && arg1) 
            {
                this.playlist.UpdateSongItem(arg1);
            }
            return;
        }

        public function AttachCover(arg1:flash.display.Loader):void
        {
            this.cover.AttachCover(arg1);
            this.PositionElements();
            return;
        }

        public function ShowCover(arg1:String):void
        {
            this.cover.ShowCover(arg1);
            this.PositionElements();
            return;
        }

        public function SelectSongItem(arg1:String):void
        {
            this.playlist.SelectSongItem(arg1);
            return;
        }

        private function PositionElements():void
        {
            this.btnReview.y = this.cover.y + this.cover.height + this.border;
            this.logo.y = this.btnReview.y + this.btnReview.height + this.border;
            return;
        }

        private const border:uint=5;

        private var spBg:com.flash.mp3player.playlist.components.LeftColumn;

        private var cover:com.flash.mp3player.playlist.components.AlbumCover;

        private var btnReview:com.flash.mp3player.playlist.components.ReviewButton;

        private var logo:com.flash.mp3player.playlist.components.Logo;

        private var playlist:com.flash.mp3player.playlist.components.Playlist;
    }
}
