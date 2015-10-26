package com.flash.mp3player.player 
{
    import com.flash.modules.text.*;
    import com.flash.mp3player.player.components.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    
    public class PlayerView extends flash.display.Sprite
    {
        public function PlayerView()
        {
            super();
            return;
        }

        public function ShowInfo(arg1:String):void
        {
            this.tfSongInfo.text = arg1;
            if (this.tfSongInfo.textWidth > this.tfSongInfo.width) 
            {
                this.CreateCreepLine();
            }
            else 
            {
                this.CreateCreepLine(false);
            }
            return;
        }

        public function ShowLoadingProgress(arg1:Number):void
        {
            this.spProgress.ShowLoadingProgress(arg1);
            return;
        }

        public function ShowProgressBar(arg1:Boolean=true):void
        {
            this.spProgress.ShowProgressBar(arg1);
            return;
        }

        public function ShowCurrentTime(arg1:String=""):void
        {
            this.tfCurrentTime.text = arg1;
            this.tfCurrentTime.width = this.tfCurrentTime.textWidth + 10;
            this.tfCurrentTime.x = this.spSongInfoBg.x + this.spSongInfoBg.width - this.tfCurrentTime.width;
            return;
        }

        public function ShowPlayingProgress(arg1:Number):void
        {
            this.spProgress.ShowPlayingProgress(arg1);
            return;
        }

        public function SetVolume(arg1:Number):void
        {
            this.spVolume.SetVolume(arg1);
            return;
        }

        public function Play():void
        {
            this.btnPlayPause.Play();
            return;
        }

        public function Pause():void
        {
            this.btnPlayPause.Pause();
            return;
        }

        public function Mute():void
        {
            this.btnMute.Mute();
            return;
        }

        public function Unmute():void
        {
            this.btnMute.Unmute();
            return;
        }

        public function RepeatOn():void
        {
            this.btnRepeat.TurnOn();
            return;
        }

        public function RepeatOff():void
        {
            this.btnRepeat.TurnOff();
            return;
        }

        public function HideSplashScreen():void
        {
            this.spSplashScreen.visible = false;
            return;
        }

        private function StartMoveCreepLine(arg1:flash.events.TimerEvent):void
        {
            this.tfSongInfo.scrollH = 0;
            this.addEventListener(flash.events.Event.ENTER_FRAME, this.MoveCreepLineHandler);
            return;
        }

        private function MoveCreepLineHandler(arg1:flash.events.Event):void
        {
            if (this.tfSongInfo.scrollH != this.tfSongInfo.maxScrollH) 
            {
                this.tfSongInfo.scrollH = this.tfSongInfo.scrollH + 1;
            }
            else 
            {
                this.removeEventListener(flash.events.Event.ENTER_FRAME, this.MoveCreepLineHandler);
                this.timer.reset();
                this.timer.start();
            }
            return;
        }

        private function AddedToStageHandler(arg1:flash.events.Event):void
        {
            this.spSplashScreen = new com.flash.mp3player.player.components.SplashScreen();
            this.spSplashScreen.Init(this.stage);
            this.stage.addChild(this.spSplashScreen);
            return;
        }

        public function Init(arg1:uint):void
        {
            this.addEventListener(flash.events.Event.ADDED_TO_STAGE, this.AddedToStageHandler);
            this.spPlayerBg = new com.flash.mp3player.player.components.PlayerBg();
            this.spPlayerBg.Init(arg1);
            this.addChild(this.spPlayerBg);
            this.spSongInfoBg = new com.flash.mp3player.player.components.SongInfoBg();
            this.spSongInfoBg.x = this.spPlayerBg.x + 6;
            this.spSongInfoBg.y = this.spPlayerBg.y + 5;
            this.spSongInfoBg.Init(arg1 - 2 * this.spSongInfoBg.x);
            this.addChild(this.spSongInfoBg);
            this.tfSongInfo = new com.flash.modules.text.Text("tfSongInfo", "");
            this.tfSongInfo.mouseEnabled = false;
            this.tfSongInfo.width = this.spSongInfoBg.width - 55;
            this.tfSongInfo.height = this.spSongInfoBg.height;
            this.tfSongInfo.x = this.spSongInfoBg.x + 11;
            this.tfSongInfo.y = this.spSongInfoBg.y + 2;
            this.addChild(this.tfSongInfo);
            this.tfCurrentTime = new com.flash.modules.text.Text("tfCurrentTime", "");
            this.tfCurrentTime.mouseEnabled = false;
            this.tfCurrentTime.height = this.spSongInfoBg.height;
            this.tfCurrentTime.y = this.spSongInfoBg.y + 2;
            this.addChild(this.tfCurrentTime);
            this.spProgress = new com.flash.mp3player.player.components.ProgressSlider();
            this.spProgress.Init(this.spSongInfoBg.width);
            this.spProgress.x = this.spSongInfoBg.x;
            this.spProgress.y = this.spSongInfoBg.y + this.spSongInfoBg.height + 4;
            this.addChild(this.spProgress);
            this.btnPlayPause = new com.flash.mp3player.player.components.PlayPauseButton();
            this.btnPlayPause.Init();
            this.btnPlayPause.x = this.spSongInfoBg.x + 3;
            this.btnPlayPause.y = this.spProgress.y + this.spProgress.height + 2;
            this.addChild(this.btnPlayPause);
            this.btnStop = new com.flash.mp3player.player.components.StopButton();
            this.btnStop.Init();
            this.btnStop.x = this.btnPlayPause.x + this.btnPlayPause.width + 2;
            this.btnStop.y = this.btnPlayPause.y;
            this.addChild(this.btnStop);
            this.btnPrev = new com.flash.mp3player.player.components.PrevSongButton();
            this.btnPrev.Init();
            this.btnPrev.x = this.btnStop.x + this.btnStop.width + 2;
            this.btnPrev.y = this.btnPlayPause.y;
            this.addChild(this.btnPrev);
            this.btnNext = new com.flash.mp3player.player.components.NextSongButton();
            this.btnNext.Init();
            this.btnNext.x = this.btnPrev.x + this.btnPrev.width + 2;
            this.btnNext.y = this.btnPlayPause.y;
            this.addChild(this.btnNext);
            this.btnInfo = new com.flash.mp3player.player.components.InfoBtn();
            this.btnInfo.Init();
            this.btnInfo.width = 0;
            this.btnInfo.x = this.spSongInfoBg.x + this.spSongInfoBg.width - this.btnInfo.width - 3;
            this.btnInfo.y = this.btnPlayPause.y + (this.btnPlayPause.height - this.btnInfo.height) / 2;
            this.btnInfo.addEventListener(flash.events.MouseEvent.CLICK, this.InfoClickHandler);
            this.addChild(this.btnInfo);
            this.btnInfo.visible = false;
            this.btnCode = new com.flash.mp3player.player.components.CodeButton();
            this.btnCode.Init();
            this.btnCode.x = this.btnInfo.x - this.btnCode.width - 3;
            this.btnCode.y = this.btnPlayPause.y;
            this.btnCode.addEventListener(flash.events.MouseEvent.CLICK, this.CodeClickHandler);
            this.addChild(this.btnCode);
            this.btnRepeat = new com.flash.mp3player.player.components.RepeatButton();
            this.btnRepeat.Init();
            this.btnRepeat.x = this.btnCode.x - this.btnRepeat.width - 3;
            this.btnRepeat.y = this.btnPlayPause.y;
            this.addChild(this.btnRepeat);
            this.RepeatOff();
            this.btnShuffle = new com.flash.mp3player.player.components.ShuffleButton();
            this.btnShuffle.Init();
            this.btnShuffle.x = this.btnRepeat.x - this.btnShuffle.width - 2;
            this.btnShuffle.y = this.btnPlayPause.y;
            this.addChild(this.btnShuffle);
            this.spVolume = new com.flash.mp3player.player.components.VolumeSlider();
            this.spVolume.Init();
            this.spVolume.x = this.btnShuffle.x - this.spVolume.width - 6;
            this.spVolume.y = this.btnPlayPause.y + (this.btnPlayPause.height - this.spVolume.height) / 2 + 2;
            this.addChild(this.spVolume);
            this.btnMute = new com.flash.mp3player.player.components.MuteButton();
            this.btnMute.Init();
            this.btnMute.x = this.spVolume.x - this.btnMute.width - 3;
            this.btnMute.y = this.btnPlayPause.y + (this.btnPlayPause.height - this.btnMute.height) / 2;
            this.addChild(this.btnMute);
            return;
        }

        private function CodeClickHandler(arg1:flash.events.MouseEvent):void
        {
            this.btnCode.ShowCode(this.stage);
            return;
        }

        private function InfoClickHandler(arg1:flash.events.MouseEvent):void
        {
            this.btnCode.ShowInfo(this.stage, this.infoMessage);
            return;
        }

        public function set ShowBtnInfo(arg1:Boolean):void
        {
            if (this.btnInfo.visible == arg1) 
            {
                return;
            }
            this.btnInfo.visible = arg1;
            var loc1:*=arg1 ? -1 : 1;
            this.Redraw((this.btnInfo.width + 3) * loc1);
            return;
        }

        public function set ShowBtnCode(arg1:Boolean):void
        {
            if (this.btnCode.visible == arg1) 
            {
                return;
            }
            this.btnCode.visible = arg1;
            var loc1:*=arg1 ? -1 : 1;
            this.Redraw((this.btnCode.width + 3) * loc1);
            return;
        }

        private function CreateCreepLine(arg1:Boolean=true):void
        {
            if (this.timer) 
            {
                this.timer.reset();
            }
            if (arg1) 
            {
                if (!this.timer) 
                {
                    this.timer = new flash.utils.Timer(2000, 1);
                    this.timer.addEventListener(flash.events.TimerEvent.TIMER, this.StartMoveCreepLine);
                }
                this.timer.start();
            }
            else 
            {
                this.tfSongInfo.scrollH = 0;
                this.removeEventListener(flash.events.Event.ENTER_FRAME, this.MoveCreepLineHandler);
            }
            return;
        }

        private function Redraw(arg1:Number):void
        {
            this.btnCode.x = this.btnCode.x + arg1;
            this.btnRepeat.x = this.btnRepeat.x + arg1;
            this.btnShuffle.x = this.btnShuffle.x + arg1;
            this.spVolume.x = this.spVolume.x + arg1;
            this.btnMute.x = this.btnMute.x + arg1;
            return;
        }

        public function GetHeight():uint
        {
            return this.spPlayerBg.height;
        }

        private const border:uint=3;

        private const infoMessage:String="<p align=\"center\"><font face=\"Tahoma\"" + " size=\"11\" color=\"#ffffff\" letterspacing=\"0\" kerning=\"0\">MP3 Player&nbsp;v.1.0" + "\n©2009&nbsp;<a href=\"http://www.adobe.com\" target=\"_blank\"><u>Adobe.com</u></a></font></p>";

        private var spPlayerBg:com.flash.mp3player.player.components.PlayerBg;

        private var btnStop:com.flash.mp3player.player.components.StopButton;

        private var btnPlayPause:com.flash.mp3player.player.components.PlayPauseButton;

        private var btnNext:com.flash.mp3player.player.components.NextSongButton;

        private var btnRepeat:com.flash.mp3player.player.components.RepeatButton;

        private var btnMute:com.flash.mp3player.player.components.MuteButton;

        private var btnShuffle:com.flash.mp3player.player.components.ShuffleButton;

        private var btnCode:com.flash.mp3player.player.components.CodeButton;

        private var btnInfo:com.flash.mp3player.player.components.InfoBtn;

        private var spSplashScreen:com.flash.mp3player.player.components.SplashScreen;

        private var spSongInfoBg:com.flash.mp3player.player.components.SongInfoBg;

        private var spProgress:com.flash.mp3player.player.components.ProgressSlider;

        private var spVolume:com.flash.mp3player.player.components.VolumeSlider;

        private var tfCurrentTime:com.flash.modules.text.Text;

        private var timer:flash.utils.Timer;

        private var btnPrev:com.flash.mp3player.player.components.PrevSongButton;

        private var tfSongInfo:com.flash.modules.text.Text;
    }
}
