package com.flash.mp3player.playlist 
{
    import com.flash.mp3player.common.vo.*;
    import flash.display.*;
    
    public class PlaylistFacade extends Object
    {
        public function PlaylistFacade()
        {
            super();
            return;
        }

        public function Init(arg1:uint, arg2:flash.display.Sprite):void
        {
            this.playlistModel = new com.flash.mp3player.playlist.PlaylistModel();
            this.playlistModel.viewPositionY = arg1;
            this.playlistView = new com.flash.mp3player.playlist.PlaylistView();
            this.playlistView.y = arg1;
            arg2.addChild(this.playlistView);
            this.playlistController = new com.flash.mp3player.playlist.PlaylistController();
            this.playlistController.Init(this.playlistModel, this.playlistView);
            return;
        }

        public function ApplySettings(arg1:XML):void
        {
            this.playlistController.ApplySettings(arg1);
            return;
        }

        public function GetFirstSong():com.flash.mp3player.common.vo.SongVO
        {
            return this.playlistController.GetFirstSong();
        }

        public function GetNextSong():com.flash.mp3player.common.vo.SongVO
        {
            return this.playlistController.GetNextSong();
        }

        public function GetPrevSong():com.flash.mp3player.common.vo.SongVO
        {
            return this.playlistController.GetPrevSong();
        }

        public function SelectFirstSong():void
        {
            this.playlistController.SelectFirstSong();
            return;
        }

        public function UpdatePlaylist(arg1:com.flash.mp3player.common.vo.SongVO):void
        {
            this.playlistController.UpdatePlaylist(arg1);
            return;
        }

        public static function GetInstance():com.flash.mp3player.playlist.PlaylistFacade
        {
            if (com.flash.mp3player.playlist.PlaylistFacade.instance == null) 
            {
                com.flash.mp3player.playlist.PlaylistFacade.instance = new PlaylistFacade();
            }
            return com.flash.mp3player.playlist.PlaylistFacade.instance;
        }

        private var playlistModel:com.flash.mp3player.playlist.PlaylistModel;

        private var playlistView:com.flash.mp3player.playlist.PlaylistView;

        private var playlistController:com.flash.mp3player.playlist.PlaylistController;

        private static var instance:com.flash.mp3player.playlist.PlaylistFacade;
    }
}
