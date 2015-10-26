package com.flash.modules.utils 
{
    import flash.display.*;
    import flash.geom.*;
    
    public class UBitmap extends Object
    {
        public function UBitmap()
        {
            super();
            return;
        }

        public static function Resize(arg1:flash.display.DisplayObjectContainer, arg2:flash.geom.Rectangle, arg3:uint, arg4:uint):flash.display.Bitmap
        {
            var loc6:*=null;
            var loc7:*=null;
            var loc10:*=0;
            var loc1:*=new flash.display.BitmapData(arg3, arg4, true, 0);
            var loc2:*=[0, arg2.left, arg2.right, arg1.width];
            var loc3:*=[0, arg2.top, arg2.bottom, arg1.height];
            var loc4:*=[0, arg2.left, arg3 - arg1.width + arg2.right, arg3];
            var loc5:*=[0, arg2.top, arg4 - arg1.height + arg2.bottom, arg4];
            var loc8:*=new flash.geom.Matrix();
            var loc9:*=0;
            while (loc9 < 3) 
            {
                loc10 = 0;
                while (loc10 < 3) 
                {
                    loc6 = new flash.geom.Rectangle(loc2[loc9], loc3[loc10], loc2[loc9 + 1] - loc2[loc9], loc3[loc10 + 1] - loc3[loc10]);
                    loc7 = new flash.geom.Rectangle(loc4[loc9], loc5[loc10], loc4[loc9 + 1] - loc4[loc9], loc5[loc10 + 1] - loc5[loc10]);
                    loc8.identity();
                    loc8.a = loc7.width / loc6.width;
                    loc8.d = loc7.height / loc6.height;
                    loc8.tx = loc7.x - loc6.x * loc8.a;
                    loc8.ty = loc7.y - loc6.y * loc8.d;
                    loc1.draw(arg1, loc8, null, null, loc7, true);
                    ++loc10;
                }
                ++loc9;
            }
            return new flash.display.Bitmap(loc1);
        }
    }
}
