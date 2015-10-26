package com.flash.mp3player.playlist 
{
    import com.flash.mp3player.common.*;
    import com.flash.mp3player.common.vo.*;
    import com.flash.mp3player.playlist.description.*;
    import com.flash.mp3player.playlist.events.*;
    import com.flash.mp3player.playlist.loader.*;
    import flash.net.*;
    
    public class PlaylistController extends Object
    {
        public function PlaylistController()
        {
            super();
            return;
        }

        public function Init(arg1:com.flash.mp3player.playlist.PlaylistModel, arg2:com.flash.mp3player.playlist.PlaylistView):void
        {
            this.playlistModel = arg1;
            this.playlistView = arg2;
            this.playlistView.addEventListener(com.flash.mp3player.playlist.events.SongClickEvent.SONG_PLAY, this.SongPlayHandler);
            this.playlistView.addEventListener(com.flash.mp3player.playlist.events.ReviewClickEvent.REVIEW_SHOW, this.ReviewHandler);
            this.playlistView.addEventListener(com.flash.mp3player.playlist.events.LogoClickEvent.GOTOURL, this.LogoHandler);
            return;
        }

        public function ApplySettings(arg1:XML):void
        {
            var loc2:*=null;
            var loc3:*=null;
            this.playlistModel.settingsDesc = new com.flash.mp3player.playlist.description.SettingsDesc(arg1.settings[0]);
            this.playlistModel.arSongs = new Array();
            var loc1:*=1;
            var loc4:*=0;
            var loc5:*=arg1.song;
            for each (loc2 in loc5) 
            {
                loc3 = new com.flash.mp3player.common.vo.SongVO();
                if (String(loc2.title).length != 0) 
                {
                    loc3.title = String(loc2.title);
                }
                if (String(loc2.artist).length != 0) 
                {
                    loc3.artist = String(loc2.artist);
                }
                if (String(loc2.length).length != 0) 
                {
                    loc3.length = Number(loc2.length);
                }
                loc3.url = this.playlistModel.settingsDesc.musicFolder + String(loc2.fileName);
                loc3.uid = loc1.toString();
                if (String(loc2.cover).length != 0) 
                {
                    loc3.cover = this.playlistModel.settingsDesc.picFolder + String(loc2.cover);
                }
                ++loc1;
                this.playlistModel.arSongs.push(loc3);
            }
            this.playlistView.dispatchEvent(new com.flash.mp3player.playlist.events.PlaylistEvent());
            if (this.playlistModel.settingsDesc.showPlaylist) 
            {
                this.playlistView.DrawPlaylist(this.playlistModel.arSongs, this.playlistModel.viewPositionY, this.playlistModel.settingsDesc.coverDesc.width, this.playlistModel.settingsDesc.coverDesc.show, this.playlistModel.settingsDesc.btnDesc.show, this.playlistModel.settingsDesc.logoDesc.show, this.playlistModel.settingsDesc.picFolder + this.playlistModel.settingsDesc.logoDesc.imageURL, this.playlistModel.settingsDesc.btnDesc.text);
                if (this.playlistModel.settingsDesc.coverDesc.show == true) 
                {
                    this.LoadDefaultCover(this.playlistModel.settingsDesc.picFolder + this.playlistModel.settingsDesc.coverDesc.imageURL);
                }
            }
            return;
        }

        private function LoadDefaultCover(arg1:String):void
        {
            this.imageLoader = new com.flash.mp3player.playlist.loader.ImageLoader();
            this.imageLoader.Load(arg1);
            this.imageLoader.addEventListener(com.flash.mp3player.playlist.events.ImageEvent.IMAGE_LOADED, this.ImageLoadedHandler);
            return;
        }

        private function ImageLoadedHandler(arg1:com.flash.mp3player.playlist.events.ImageEvent):void
        {
            var loc1:*=0;
            var loc2:*=null;
            if (arg1.image.name != "0") 
            {
                loc1 = 0;
                while (loc1 < this.playlistModel.arSongs.length) 
                {
                    loc2 = this.playlistModel.arSongs[loc1];
                    if (loc2.uid == arg1.image.name) 
                    {
                        loc2.coverLoaded = true;
                    }
                    ++loc1;
                }
            }
            this.playlistView.AttachCover(arg1.image);
            return;
        }

        public function SongPlayHandler(arg1:com.flash.mp3player.playlist.events.SongClickEvent):void
        {
            if (arg1.songVO == null) 
            {
                return;
            }
            this.playlistModel.currentSongUID = arg1.songVO.uid;
            if (this.playlistModel.settingsDesc.showPlaylist) 
            {
                this.playlistView.SelectSongItem(arg1.songVO.uid);
                if (this.playlistModel.settingsDesc.coverDesc.show) 
                {
                    if (arg1.songVO.cover != "") 
                    {
                        if (!arg1.songVO.coverLoaded) 
                        {
                            this.imageLoader.Load(arg1.songVO.cover, arg1.songVO.uid);
                        }
                        else 
                        {
                            this.playlistView.ShowCover(arg1.songVO.uid);
                        }
                    }
                }
            }
            return;
        }

        public function UpdatePlaylist(arg1:com.flash.mp3player.common.vo.SongVO):void
        {
            if (this.playlistView) 
            {
                this.playlistView.UpdatePlaylist(arg1);
            }
            return;
        }

        public function GetFirstSong():com.flash.mp3player.common.vo.SongVO
        {
            return this.playlistModel.arSongs[0];
        }

        public function SelectFirstSong():void
        {
            this.SongPlayHandler(new com.flash.mp3player.playlist.events.SongClickEvent(this.playlistModel.arSongs[0]));
            return;
        }

        public function GetNextSong():com.flash.mp3player.common.vo.SongVO
        {
            var loc1:*=null;
            if (com.flash.mp3player.common.CommonModel.GetInst().shuffle) 
            {
                return this.GetRandomSong();
            }
            loc1 = null;
            if (this.playlistModel.currentSongUID != this.playlistModel.arSongs.length.toString()) 
            {
                loc1 = this.playlistModel.arSongs[this.playlistModel.currentSongUID];
            }
            else if (com.flash.mp3player.common.CommonModel.GetInst().repeate) 
            {
                loc1 = this.playlistModel.arSongs[0];
            }
            this.SongPlayHandler(new com.flash.mp3player.playlist.events.SongClickEvent(loc1));
            return loc1;
        }

        public function GetPrevSong():com.flash.mp3player.common.vo.SongVO
        {
            var loc1:*=null;
            if (com.flash.mp3player.common.CommonModel.GetInst().shuffle) 
            {
                return this.GetRandomSong();
            }
            loc1 = null;
            if (this.playlistModel.currentSongUID != "1") 
            {
                loc1 = this.playlistModel.arSongs[int(this.playlistModel.currentSongUID) - 2];
            }
            else if (com.flash.mp3player.common.CommonModel.GetInst().repeate) 
            {
                loc1 = this.playlistModel.arSongs[this.playlistModel.arSongs.length - 1];
            }
            this.SongPlayHandler(new com.flash.mp3player.playlist.events.SongClickEvent(loc1));
            return loc1;
        }

        private function GetRandomSong():com.flash.mp3player.common.vo.SongVO
        {
            var loc1:*=Math.random() * this.playlistModel.arSongs.length;
            if (loc1.toString() == this.playlistModel.currentSongUID) 
            {
                if (this.playlistModel.currentSongUID != this.playlistModel.arSongs.length.toString()) 
                {
                    if (this.playlistModel.currentSongUID != "1") 
                    {
                        loc1 = int(this.playlistModel.currentSongUID) - 2;
                    }
                    else 
                    {
                        loc1 = this.playlistModel.arSongs.length - 1;
                    }
                }
                else 
                {
                    loc1 = 0;
                }
            }
            this.SongPlayHandler(new com.flash.mp3player.playlist.events.SongClickEvent(this.playlistModel.arSongs[loc1]));
            return this.playlistModel.arSongs[loc1];
        }

        private function ReviewHandler(arg1:com.flash.mp3player.playlist.events.ReviewClickEvent):void
        {
            var evt:com.flash.mp3player.playlist.events.ReviewClickEvent;

            var loc1:*;
            evt = arg1;
            try 
            {
                flash.net.navigateToURL(new flash.net.URLRequest(this.playlistModel.settingsDesc.btnDesc.href), "_blank");
            }
            catch (e:SecurityError)
            {
                throw new Error(e.message);
            }
            return;
        }

        private function LogoHandler(arg1:com.flash.mp3player.playlist.events.LogoClickEvent):void
        {
            var evt:com.flash.mp3player.playlist.events.LogoClickEvent;

            var loc1:*;
            evt = arg1;
            try 
            {
                flash.net.navigateToURL(new flash.net.URLRequest(this.playlistModel.settingsDesc.logoDesc.href), "_blank");
            }
            catch (e:SecurityError)
            {
                throw new Error(e.message);
            }
            return;
        }

        private var imageLoader:com.flash.mp3player.playlist.loader.ImageLoader;

        private var playlistModel:com.flash.mp3player.playlist.PlaylistModel;

        private var playlistView:com.flash.mp3player.playlist.PlaylistView;
    }
}
