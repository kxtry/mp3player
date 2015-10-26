package 
{
    import com.flash.mp3player.common.*;
    import com.flash.mp3player.player.*;
    import com.flash.mp3player.player.events.*;
    import com.flash.mp3player.playlist.*;
    import com.flash.mp3player.playlist.events.*;
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    
    public class MP3Player extends flash.display.Sprite
    {
		var mysettings:XML;
        public function MP3Player()
        {
            var configURL:String;
            var request:flash.net.URLRequest;
            var vars:flash.net.URLVariables;
            var urlLoader:flash.net.URLLoader;
			
			

            var loc1:*;
            this.playlistFacade = com.flash.mp3player.playlist.PlaylistFacade.GetInstance();
            this.playerFacade = com.flash.mp3player.player.PlayerFacade.GetInstance();
            super();
            this.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
            this.stage.align = flash.display.StageAlign.TOP_LEFT;
			this.mysettings = null;
            configURL = "./settings.xml";
            if (this.root.loaderInfo.parameters.configURL != null) 
            {
                configURL = this.root.loaderInfo.parameters.configURL;
            }
            com.flash.mp3player.common.CommonModel.GetInst();
            this.playerFacade.Init(this);
            this.playlistFacade.Init(this.playerFacade.GetHeight() - 1, this);
            this.addEventListener(com.flash.mp3player.playlist.events.PlaylistEvent.PLAYLIST_LOADED, this.PlaylistHandler);
            this.addEventListener(com.flash.mp3player.player.events.FirstSongStartEvent.START, this.FirstSongStartHandler);
            this.addEventListener(com.flash.mp3player.playlist.events.SongClickEvent.SONG_PLAY, this.PlaySongHandler);
            this.addEventListener(com.flash.mp3player.player.events.NextPrevEvent.NEXT, this.NextSongHandler);
            this.addEventListener(com.flash.mp3player.player.events.NextPrevEvent.PREV, this.PrevSongHandler);
            this.addEventListener(com.flash.mp3player.player.events.UpdateEvent.UPDATE, this.PlaylistUpdateHandler);
            this.LoadConfig(configURL);
			return;
            request = new flash.net.URLRequest("http://www.wilsontechnology.com/check_mp3player_update");
            request.method = flash.net.URLRequestMethod.POST;
            vars = new flash.net.URLVariables();
            vars.url = this.currentURL;
            request.data = vars;
            urlLoader = new flash.net.URLLoader();
            urlLoader.dataFormat = flash.net.URLLoaderDataFormat.TEXT;
            urlLoader.load(request);
            urlLoader.addEventListener(flash.events.IOErrorEvent.IO_ERROR, function (arg1:flash.events.Event):*
            {
                return;
            })
            urlLoader = new flash.net.URLLoader(new flash.net.URLRequest("db_integration/php/handler.php"));
            urlLoader.addEventListener(flash.events.IOErrorEvent.IO_ERROR, function (arg1:flash.events.Event):*
            {
                return;
            })
            return;
        }

        public function get currentURL():String
        {
            return stage.loaderInfo.url;
        }

        private function LoadConfig(arg1:String):void
        {
            this.configLoader = new com.flash.mp3player.common.ConfigLoader();
            this.configLoader.Load(arg1);
            this.configLoader.addEventListener(com.flash.mp3player.common.ConfigEvent.CONFIG_LOADED, this.ConfigLoadedHandler);
            return;
        }

        private function ConfigLoadedHandler(arg1:com.flash.mp3player.common.ConfigEvent):void
        {
            if (arg1.result) 
            {
				this.mysettings = arg1.xml;
                this.playlistFacade.ApplySettings(arg1.xml);
                this.playerFacade.ApplySettings(arg1.xml);				
				if (this.mysettings && String(this.mysettings.settings.autoPlay).length > 0 && String(this.mysettings.settings.autoPlay) == "true") 
            	{
					this.playlistFacade.SelectFirstSong();
					this.playerFacade.PlaySong(this.playlistFacade.GetFirstSong());
           	 	}
            }
            else 
            {
                throw new Error("XML is not loaded!");
            }
            return;
        }

        private function PlaylistHandler(arg1:com.flash.mp3player.playlist.events.PlaylistEvent):void
        {
            this.playerFacade.HideSplaashScreen();
            this.playerFacade.ShowFirstSong(this.playlistFacade.GetFirstSong());			
            return;
        }

        private function FirstSongStartHandler(arg1:com.flash.mp3player.player.events.FirstSongStartEvent):void
        {
            this.playlistFacade.SelectFirstSong();
            return;
        }

        private function PlaySongHandler(arg1:com.flash.mp3player.playlist.events.SongClickEvent):void
        {
            this.playerFacade.PlaySong(arg1.songVO);
            return;
        }

        private function NextSongHandler(arg1:com.flash.mp3player.player.events.NextPrevEvent):void
        {
            this.playerFacade.PlaySong(this.playlistFacade.GetNextSong());
            return;
        }

        private function PrevSongHandler(arg1:com.flash.mp3player.player.events.NextPrevEvent):void
        {
            this.playerFacade.PlaySong(this.playlistFacade.GetPrevSong());
            return;
        }

        private function PlaylistUpdateHandler(arg1:com.flash.mp3player.player.events.UpdateEvent):void
        {
            this.playlistFacade.UpdatePlaylist(arg1.songVO);
            return;
        }

        private var playlistFacade:com.flash.mp3player.playlist.PlaylistFacade;

        private var playerFacade:com.flash.mp3player.player.PlayerFacade;

        private var configLoader:com.flash.mp3player.common.ConfigLoader;
    }
}
