package com.flash.mp3player.common 
{
    import flash.events.*;
    
    public class ConfigEvent extends flash.events.Event
    {
        public function ConfigEvent(arg1:Boolean, arg2:XML)
        {
            super(com.flash.mp3player.common.ConfigEvent.CONFIG_LOADED);
            this.result = arg1;
            this.xml = arg2;
            return;
        }

        public static const CONFIG_LOADED:String="configLoaded";

        public var result:Boolean;

        public var xml:XML;
    }
}
