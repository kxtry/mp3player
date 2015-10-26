package com.flash.modules.text 
{
    import flash.text.*;
    
    public class Text extends flash.text.TextField
    {
        public function Text(arg1:String, arg2:String, arg3:String="Tahoma", arg4:uint=11, arg5:Object=16777215, arg6:String="none", arg7:String="dynamic", arg8:Boolean=false, arg9:Boolean=false, arg10:Boolean=false, arg11:Boolean=false, arg12:String="left")
        {
            var name:String;
            var txt:String;
            var font:String="Tahoma";
            var size:uint=11;
            var color:Object=16777215;
            var autoSize:String="none";
            var type:String="dynamic";
            var bold:Boolean=false;
            var selectable:Boolean=false;
            var multiline:Boolean=false;
            var wordwrap:Boolean=false;
            var align:String="left";
            var format:flash.text.TextFormat;

            var loc1:*;
            name = arg1;
            txt = arg2;
            font = arg3;
            size = arg4;
            color = arg5;
            autoSize = arg6;
            type = arg7;
            bold = arg8;
            selectable = arg9;
            multiline = arg10;
            wordwrap = arg11;
            align = arg12;
            super();
            this.name = name;
            format = new flash.text.TextFormat();
            format.size = size;
            format.font = font;
            format.bold = bold;
            format.color = color;
            format.align = align;
            var loc2:*;
            with (loc2 = this) 
            {
                defaultTextFormat = format;
                type = type;
                autoSize = autoSize;
                antiAliasType = AntiAliasType.ADVANCED;
                selectable = selectable;
                multiline = multiline;
                wordWrap = wordwrap;
                border = border;
                borderColor = borderColor;
                background = background;
                backgroundColor = backgroundColor;
                appendText(txt);
            }
            return;
        }
    }
}
