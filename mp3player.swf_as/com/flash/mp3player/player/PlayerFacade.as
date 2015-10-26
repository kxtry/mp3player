package com.flash.mp3player.player 
{
    import com.flash.mp3player.common.*;
    import com.flash.mp3player.common.vo.*;
    import flash.display.*;
    
    public class PlayerFacade extends Object
    {
        public function PlayerFacade()
        {
            super();
            return;
        }

        public function Init(arg1:flash.display.Sprite):void
        {
            this.playerModel = new com.flash.mp3player.player.PlayerModel();
            var loc1:*=Math.max(arg1.stage.stageWidth, com.flash.mp3player.common.CommonModel.MIN_APP_WIDTH);
            this.playerView = new com.flash.mp3player.player.PlayerView();
            this.playerView.Init(loc1);
            arg1.addChild(this.playerView);
            this.playerController = new com.flash.mp3player.player.PlayerController();
            this.playerController.Init(this.playerModel, this.playerView);
            return;
        }

        public function ApplySettings(arg1:XML):void
        {
            this.playerController.ApplySettings(arg1);
            return;
        }

        public function ShowFirstSong(arg1:com.flash.mp3player.common.vo.SongVO):void
        {
            this.playerController.ShowFirstSong(arg1);
            return;
        }

        public function PlaySong(arg1:com.flash.mp3player.common.vo.SongVO):void
        {
            this.playerController.PlaySong(arg1);
            return;
        }

        public function GetHeight():uint
        {
            return this.playerView.GetHeight();
        }

        public function HideSplaashScreen():void
        {
            this.playerView.HideSplashScreen();
            return;
        }

        public static function GetInstance():com.flash.mp3player.player.PlayerFacade
        {
            if (com.flash.mp3player.player.PlayerFacade.instance == null) 
            {
                com.flash.mp3player.player.PlayerFacade.instance = new PlayerFacade();
            }
            return com.flash.mp3player.player.PlayerFacade.instance;
        }

        private var playerModel:com.flash.mp3player.player.PlayerModel;

        private var playerView:com.flash.mp3player.player.PlayerView;

        private var playerController:com.flash.mp3player.player.PlayerController;

        private static var instance:com.flash.mp3player.player.PlayerFacade;
    }
}
