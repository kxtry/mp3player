package com.flash.mp3player.common 
{
    public class CommonModel extends Object
    {
        public function CommonModel()
        {
            super();
            return;
        }

        public static function GetInst():com.flash.mp3player.common.CommonModel
        {
            if (com.flash.mp3player.common.CommonModel.inst == null) 
            {
                com.flash.mp3player.common.CommonModel.inst = new CommonModel();
            }
            return com.flash.mp3player.common.CommonModel.inst;
        }

        
        {
            inst = null;
        }

        public static const MIN_APP_WIDTH:uint=320;

        public static const MIN_APP_HEIGHT:uint=140;

        public var repeate:Boolean=false;

        public var shuffle:Boolean=false;

        private static var inst:com.flash.mp3player.common.CommonModel=null;
    }
}
