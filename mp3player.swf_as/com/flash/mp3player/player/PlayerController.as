package com.flash.mp3player.player 
{
    import com.flash.modules.utils.*;
    import com.flash.mp3player.common.*;
    import com.flash.mp3player.common.vo.*;
    import com.flash.mp3player.player.events.*;
    import flash.events.*;
    import flash.media.*;
    import flash.net.*;
    
    public class PlayerController extends Object
    {
        public function PlayerController()
        {
            super();
            return;
        }

        public function Init(arg1:com.flash.mp3player.player.PlayerModel, arg2:com.flash.mp3player.player.PlayerView):void
        {
            this.playerModel = arg1;
            this.arSounds = new Array();
            this.soundLoaderContext = new flash.media.SoundLoaderContext(1000, true);
            this.playerView = arg2;
            this.playerView.addEventListener(com.flash.mp3player.player.events.PlayPauseClickEvent.PLAY_PAUSE_CLICK, this.PlayPauseHandler);
            this.playerView.addEventListener(com.flash.mp3player.player.events.StopClickEvent.STOP, this.StopHandler);
            this.playerView.addEventListener(com.flash.mp3player.player.events.VolumeEvent.CHANGE_VOLUME, this.VolumeHandler);
            this.playerView.addEventListener(com.flash.mp3player.player.events.MuteClickEvent.MUTE, this.MuteHandler);
            this.playerView.addEventListener(com.flash.mp3player.player.events.RepeatClickEvent.REPEAT, this.RepeatHandler);
            this.playerView.addEventListener(com.flash.mp3player.player.events.SeekEvent.SEEK, this.SeekHandler);
            this.playerView.addEventListener(com.flash.mp3player.player.events.ShuffleClickEvent.SHUFFLE, this.ShuffleHandler);
            this.playerView.addEventListener(com.flash.mp3player.player.events.NextClickEvent.NEXT, this.NextHandler);
            this.playerView.addEventListener(com.flash.mp3player.player.events.PrevClickEvent.PREV, this.PrevHandler);
            return;
        }

        public function ApplySettings(arg1:XML):void
        {
            var loc1:*=true;
            var loc2:*=true;
            if (!(String(arg1.settings.showBtnHtml).length == 0) && !(String(arg1.settings.showBtnHtml) == "true")) 
            {
                loc1 = false;
            }
            if (!(String(arg1.settings.showBtnInfo).length == 0) && !(String(arg1.settings.showBtnInfo) == "true")) 
            {
                loc2 = false;
            }
            this.playerView.ShowBtnCode = loc1;
            this.playerView.ShowBtnInfo = loc2;
            return;
        }

        public function ShowFirstSong(arg1:com.flash.mp3player.common.vo.SongVO):void
        {
            this.playerModel.curSong = arg1;
            this.playerView.ShowInfo(arg1.uid + ". " + arg1.artist + " - " + arg1.title);
            this.playerView.ShowCurrentTime("00:00");
            return;
        }

        public function PlaySong(arg1:com.flash.mp3player.common.vo.SongVO):void
        {
            if (arg1 == null) 
            {
                return;
            }
            if (this.sound) 
            {
                try 
                {
                    this.sound.close();
                    this.sound.removeEventListener(flash.events.Event.ID3, this.ID3Handler);
                }
                catch (e:Error)
                {
                };
            }
            this.sound = new flash.media.Sound();
            this.sound.addEventListener(flash.events.ProgressEvent.PROGRESS, this.LoadingProgressHandler);
            this.sound.addEventListener(flash.events.IOErrorEvent.IO_ERROR, this.IOErrorHandler);
            this.sound.addEventListener(flash.events.Event.ID3, this.ID3Handler);
            this.sound.load(new flash.net.URLRequest(arg1.url), this.soundLoaderContext);
            this.arSounds[arg1.uid] = this.sound;
            if (this.soundChannel) 
            {
                this.soundChannel.stop();
                this.soundChannel.removeEventListener(flash.events.Event.SOUND_COMPLETE, this.SongCompleteHandler);
            }
            this.soundChannel = this.sound.play();
            this.soundChannel.addEventListener(flash.events.Event.SOUND_COMPLETE, this.SongCompleteHandler);
            this.playerModel.curSong = arg1;
            this.playerModel.isPlaying = true;
            if (arg1.length == 0) 
            {
                this.playerView.ShowProgressBar(false);
            }
            else 
            {
                this.playerView.ShowProgressBar();
            }
            this.playerView.ShowInfo(arg1.uid + ". " + arg1.artist + " - " + arg1.title);
            this.playerView.Play();
            this.playerView.ShowLoadingProgress(0);
            this.playerView.addEventListener(flash.events.Event.ENTER_FRAME, this.PlayingProgressHandler);
            this.UpdateVolume();
            return;
        }

        private function ID3Handler(arg1:flash.events.Event):void
        {
            var loc1:*=arg1.target as flash.media.Sound;
            var loc2:*=this.playerModel.curSong;
            /*if (loc1.id3.TPE1 != "") 
            {
                loc2.artist = loc1.id3.TPE1;
            }
            if (loc1.id3.TIT2 != "") 
            {
                loc2.title = loc1.id3.TIT2;
            }*/
            this.playerModel.curSong = loc2;
            this.playerView.ShowInfo(loc2.uid + ". " + loc2.artist + " - " + loc2.title);
            this.playerView.dispatchEvent(new com.flash.mp3player.player.events.UpdateEvent(this.playerModel.curSong));
            return;
        }

        private function PlayingProgressHandler(arg1:flash.events.Event):void
        {
            var loc1:*=NaN;
            if (this.playerModel.isPlaying) 
            {
                loc1 = this.soundChannel.position;
            }
            else 
            {
                loc1 = this.playerModel.curPosition;
            }
			if (this.sound.length > 0 && !this.sound.isBuffering)
			{
				this.playerModel.curSong.length = this.sound.length / 1000;
			}
            this.playerView.ShowPlayingProgress(loc1 / this.playerModel.curSong.length / 1000);
			var tm1,tm2:String;
			tm1 = com.flash.modules.utils.UDateTime.ConvertToMinutesStr(loc1 / 1000);
			tm2 = com.flash.modules.utils.UDateTime.ConvertToMinutesStr(this.playerModel.curSong.length);
            this.playerView.ShowCurrentTime(tm1+' / '+tm2);
			this.playerView.dispatchEvent(new com.flash.mp3player.player.events.UpdateEvent(this.playerModel.curSong));
            return;
        }

        private function LoadingProgressHandler(arg1:flash.events.ProgressEvent):void
        {
            this.playerView.ShowLoadingProgress(arg1.bytesLoaded / arg1.bytesTotal);
            return;
        }

        private function IOErrorHandler(arg1:flash.events.IOErrorEvent):void
        {
            throw new Error(arg1.text);
        }

        private function SongCompleteHandler(arg1:flash.events.Event):void
        {
            this.playerModel.curPosition = 0;
            this.playerModel.isPlaying = false;
            this.playerView.ShowPlayingProgress(0);
            this.playerView.Pause();
            this.playerView.removeEventListener(flash.events.Event.ENTER_FRAME, this.PlayingProgressHandler);
            this.NextHandler(new com.flash.mp3player.player.events.NextClickEvent());
            return;
        }

        private function PlayPauseHandler(arg1:com.flash.mp3player.player.events.PlayPauseClickEvent):void
        {
            var loc1:*=null;
            if (this.soundChannel) 
            {
                if (this.playerModel.isPlaying) 
                {
                    this.playerModel.curPosition = this.soundChannel.position;
                    this.soundChannel.stop();
                    this.playerView.Pause();
                }
                else 
                {
                    loc1 = this.arSounds[this.playerModel.curSong.uid];
                    this.soundChannel.removeEventListener(flash.events.Event.SOUND_COMPLETE, this.SongCompleteHandler);
                    this.soundChannel = loc1.play(this.playerModel.curPosition);
                    this.soundChannel.addEventListener(flash.events.Event.SOUND_COMPLETE, this.SongCompleteHandler);
                    this.playerView.Play();
                    this.playerView.addEventListener(flash.events.Event.ENTER_FRAME, this.PlayingProgressHandler);
                    this.UpdateVolume();
                }
                this.playerModel.isPlaying = !this.playerModel.isPlaying;
            }
            else 
            {
                this.PlaySong(this.playerModel.curSong);
                this.playerView.dispatchEvent(new com.flash.mp3player.player.events.FirstSongStartEvent());
            }
            return;
        }

        private function StopHandler(arg1:com.flash.mp3player.player.events.StopClickEvent):void
        {
            if (this.soundChannel) 
            {
                this.soundChannel.stop();
                this.playerModel.curPosition = 0;
                this.playerModel.isPlaying = false;
                this.playerView.removeEventListener(flash.events.Event.ENTER_FRAME, this.PlayingProgressHandler);
                this.playerView.Pause();
                this.playerView.ShowPlayingProgress(0);
                this.playerView.ShowCurrentTime();
            }
            return;
        }

        private function SeekHandler(arg1:com.flash.mp3player.player.events.SeekEvent):void
        {
            var loc1:*=null;
            if (this.soundChannel) 
            {
                if (this.playerModel.isPlaying) 
                {
                    this.soundChannel.stop();
                    loc1 = this.arSounds[this.playerModel.curSong.uid];
                    this.soundChannel.removeEventListener(flash.events.Event.SOUND_COMPLETE, this.SongCompleteHandler);
                    this.soundChannel = loc1.play(arg1.seek * this.playerModel.curSong.length * 1000);
                    this.soundChannel.addEventListener(flash.events.Event.SOUND_COMPLETE, this.SongCompleteHandler);
                    this.UpdateVolume();
                }
                else 
                {
                    this.playerModel.curPosition = arg1.seek * this.playerModel.curSong.length * 1000;
                }
            }
            return;
        }

        private function ShuffleHandler(arg1:com.flash.mp3player.player.events.ShuffleClickEvent):void
        {
            com.flash.mp3player.common.CommonModel.GetInst().shuffle = !com.flash.mp3player.common.CommonModel.GetInst().shuffle;
            return;
        }

        private function VolumeHandler(arg1:com.flash.mp3player.player.events.VolumeEvent):void
        {
            this.playerModel.curVolume = arg1.volume;
            if (this.playerModel.curVolume) 
            {
                this.playerModel.muted = false;
            }
            this.UpdateVolume();
            return;
        }

        private function UpdateVolume():void
        {
            if (this.playerModel.curVolume == 0 || this.playerModel.muted) 
            {
                this.playerView.Mute();
                this.playerModel.muted = true;
            }
            else 
            {
                this.playerView.Unmute();
                this.playerModel.muted = false;
            }
            if (this.soundChannel) 
            {
                this.soundChannel.soundTransform = new flash.media.SoundTransform(this.playerModel.muted ? 0 : this.playerModel.curVolume);
            }
            return;
        }

        private function MuteHandler(arg1:com.flash.mp3player.player.events.MuteClickEvent):void
        {
            this.playerModel.muted = arg1.mute;
            this.UpdateVolume();
            return;
        }

        private function RepeatHandler(arg1:com.flash.mp3player.player.events.RepeatClickEvent):void
        {
            if (arg1.repeat) 
            {
                this.playerView.RepeatOn();
            }
            else 
            {
                this.playerView.RepeatOff();
            }
            this.playerModel.isRepeated = arg1.repeat;
            com.flash.mp3player.common.CommonModel.GetInst().repeate = arg1.repeat;
            return;
        }

        private function NextHandler(arg1:com.flash.mp3player.player.events.NextClickEvent):void
        {
            if (this.soundChannel) 
            {
                this.playerView.dispatchEvent(new com.flash.mp3player.player.events.NextPrevEvent(com.flash.mp3player.player.events.NextPrevEvent.NEXT));
            }
            return;
        }

        private function PrevHandler(arg1:com.flash.mp3player.player.events.PrevClickEvent):void
        {
            if (this.soundChannel) 
            {
                this.playerView.dispatchEvent(new com.flash.mp3player.player.events.NextPrevEvent(com.flash.mp3player.player.events.NextPrevEvent.PREV));
            }
            return;
        }

        private var playerModel:com.flash.mp3player.player.PlayerModel;

        private var playerView:com.flash.mp3player.player.PlayerView;

        private var sound:flash.media.Sound;

        private var soundLoaderContext:flash.media.SoundLoaderContext;

        private var arSounds:Array;

        private var soundChannel:flash.media.SoundChannel;
    }
}
