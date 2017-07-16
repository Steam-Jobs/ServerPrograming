<message>
    <div class="window">
        <div class="window-header">
            <span onclick={ closeWindow }><i class="fa fa-fw fa-times fa-2x" aria-hidden="true"></i></span>
        </div>
        <div class="window-detail">
            <p>{ opts.message }</p>
        </div>

    </div>

    <script>
        var that = this

        // window(オーバーレイウィンドウ)を制御する変数
        var window
        this.on('mount',function () {
            // mixinからwindowを取得
            window = that.mixin("window")
        })

        closeWindow(){
            window.obs.trigger("hiddenWindow")
        }
    </script>

    <style type="less">
        .window {
            width: 500px;
            margin:80px auto 0;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 5px;
        }
        .window-header{
            height: 2em;
            float: right;
        }
        .window-detail{
            text-align: center;
            padding-bottom: 20px;
        }
    </style>
</message>