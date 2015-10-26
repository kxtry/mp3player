package com.flash.modules.utils 
{
    public class UDateTime extends Object
    {
        public function UDateTime()
        {
            super();
            return;
        }

        public static function ConvertToMinutesStr(arg1:uint):String
        {
            var loc3:*=null;
            var loc4:*=null;
            var loc1:*=Math.floor(arg1 / 60);
            var loc2:*=arg1 - loc1 * 60;
            if (loc1 < 10) 
            {
                loc3 = "0" + loc1;
            }
            else 
            {
                loc3 = String(loc1);
            }
            if (loc2 < 10) 
            {
                loc4 = "0" + loc2;
            }
            else 
            {
                loc4 = String(loc2);
            }
            return loc3 + ":" + loc4;
        }
    }
}
