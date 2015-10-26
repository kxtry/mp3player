package com.flash.mp3player.player.components 
{
    import com.flash.modules.text.*;
    import com.flash.modules.utils.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.system.*;
    
    public class CodeButton extends flash.display.Sprite
    {
        public function CodeButton()
        {
            super();
            return;
        }

        public function Init():void
        {
            this.cacheAsBitmap = true;
            this.useHandCursor = true;
            this.buttonMode = true;
            this.addEventListener(flash.events.MouseEvent.MOUSE_OVER, this.OverHandler);
            this.addEventListener(flash.events.MouseEvent.MOUSE_OUT, this.OutHandler);
            this.spBtnBg = new CodeBtnBgAsset();
            this.spBtnBg.visible = false;
            this.addChild(this.spBtnBg);
            this.spBtn = new CodeBtnAsset();
            this.spBtn.x = (this.spBtnBg.width - this.spBtn.width) / 2;
            this.spBtn.y = (this.spBtnBg.height - this.spBtn.height) / 2;
            this.addChild(this.spBtn);
            return;
        }

        public function ShowCode(arg1:flash.display.DisplayObjectContainer):void
        {
            this.spPanel = new flash.display.Sprite();
            this.spPanel.addEventListener(flash.events.MouseEvent.CLICK, this.HidePanelHandler);
            this.spPanelBg = new CodePanelBgAsset();
            this.spPanelBg.width = arg1.stage.stageWidth;
            this.spPanelBg.height = arg1.stage.stageHeight;
            this.spPanel.addChild(this.spPanelBg);
            this.spPanelView = new CodePanelAsset();
            this.spPanelView.alpha = 0.8;
            this.spPanelView.width = arg1.stage.stageWidth;
            this.spPanelView.height = arg1.stage.stageHeight;
            this.spPanel.addChild(this.spPanelView);
            var loc1:*=new com.flash.modules.text.Text("tfCopy", "Copy to clipboard", "Tahoma", 11, 16777215, "none", "dynamic", false, false, false, false, "center");
            loc1.mouseEnabled = false;
            loc1.width = loc1.textWidth + 10;
            loc1.height = loc1.textHeight + 7;
            this.spBtnAsset = new ColumnButtonAsset();
            var loc2:*=com.flash.modules.utils.UBitmap.Resize(this.spBtnAsset, new flash.geom.Rectangle(4, 12, 93, 7), loc1.width, loc1.height);
            this.spBtnCopy = new flash.display.Sprite();
            this.spBtnCopy.useHandCursor = true;
            this.spBtnCopy.buttonMode = true;
            this.spBtnCopy.addEventListener(flash.events.MouseEvent.CLICK, this.CopyHandler);
            this.spBtnCopy.addChild(loc2);
            this.spBtnCopy.addChild(loc1);
            var loc3:*="<embed src=\'" + this.root.loaderInfo.url + "\'" + "\n" + "type=\'application/x-shockwave-flash\'" + "\n" + "width=\'" + arg1.stage.stageWidth + "\' height=\'" + arg1.stage.stageHeight + "\'" + "\n" + "bgcolor=\'#333333\'" + "\n" + "allowFullScreen=\'false\'> " + "\n" + "</embed>";
            this.tfCode = new com.flash.modules.text.Text("tfCode", loc3, "Tahoma", 11, 16777215, "none", "dynamic", false, true, true, true);
            if (this.tfCode.textHeight + this.spBtnCopy.height + this.border < this.spPanelView.height - 2 * this.border) 
            {
                this.tfCode.x = this.border;
                this.tfCode.y = this.border;
                this.tfCode.width = this.spPanelView.width - 2 * this.border;
                this.tfCode.height = this.tfCode.textHeight + 5;
                this.spBtnCopy.x = this.border;
                this.spBtnCopy.y = this.tfCode.y + this.tfCode.height + this.border;
            }
            else 
            {
                this.tfCode.visible = false;
                this.spBtnCopy.x = this.spPanel.width - this.spBtnCopy.width - this.border;
                this.spBtnCopy.y = this.border;
            }
            this.spPanel.addChild(this.tfCode);
            this.spPanel.addChild(this.spBtnCopy);
            arg1.addChild(this.spPanel);
            return;
        }

        public function ShowInfo(arg1:flash.display.DisplayObjectContainer, arg2:String):void
        {
            this.spPanel = new flash.display.Sprite();
            this.spPanel.addEventListener(flash.events.MouseEvent.CLICK, this.HidePanelHandler);
            this.spPanelBg = new CodePanelBgAsset();
            this.spPanelBg.width = arg1.stage.stageWidth;
            this.spPanelBg.height = arg1.stage.stageHeight;
            this.spPanel.addChild(this.spPanelBg);
            this.spPanelView = new CodePanelAsset();
            this.spPanelView.alpha = 0.8;
            this.spPanelView.width = arg1.stage.stageWidth;
            this.spPanelView.height = arg1.stage.stageHeight;
            this.spPanel.addChild(this.spPanelView);
            this.tfCode = new com.flash.modules.text.Text("tfCode", "", "Tahoma", 11, 16777215, "none", "dynamic", false, false, false, false);
            this.tfCode.htmlText = arg2;
            this.tfCode.width = this.tfCode.textWidth + 5;
            this.tfCode.height = this.tfCode.textHeight + 5;
            this.tfCode.x = (this.spPanelBg.width - this.tfCode.width) / 2;
            this.tfCode.y = (this.spPanelBg.height - this.tfCode.height) / 2;
            this.spPanel.addChild(this.tfCode);
            arg1.addChild(this.spPanel);
            return;
        }

        private function HidePanelHandler(arg1:flash.events.MouseEvent):void
        {
            flash.display.DisplayObjectContainer(arg1.currentTarget).parent.removeChild(this.spPanel);
            return;
        }

        private function OverHandler(arg1:flash.events.MouseEvent):void
        {
            this.spBtnBg.visible = true;
            return;
        }

        private function OutHandler(arg1:flash.events.MouseEvent):void
        {
            this.spBtnBg.visible = false;
            return;
        }

        private function CopyHandler(arg1:flash.events.MouseEvent):void
        {
            flash.system.System.setClipboard(this.tfCode.text);
            return;
        }

        private const border:uint=10;

        private var spBtnBg:CodeBtnBgAsset;

        private var spBtn:CodeBtnAsset;

        private var spPanel:flash.display.Sprite;

        private var spPanelBg:CodePanelBgAsset;

        private var spPanelView:CodePanelAsset;

        private var tfCode:com.flash.modules.text.Text;

        private var spBtnAsset:ColumnButtonAsset;

        private var spBtnCopy:flash.display.Sprite;
    }
}
