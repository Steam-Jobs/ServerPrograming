require('../tags/menu/usermenu.tag')
<menu>
    <div class="overlay" if={ current != "" } >
        <usermenu if={ current == "usermenu" }></usermenu>
    </div>
    <script>
        var that = this

        // 表示するwindowを決定する変数
        this.current = ""

        // 他ファイルからコントロールするためのオブジェクトを定義
        var OptsMixin = {
            obs: riot.observable(),
            init:function(){
                // トリガーが発火した時の処理
                this.obs.on('hiddenMenu',function(){
                    that.current = ""
                    that.update()
                })
                this.obs.on('usermenu',function(){
                    that.current = "usermenu"
                    that.update()
                })
            }
        }
        // オブジェクトを共有部分に登録
        riot.mixin("menu",OptsMixin)

    </script>
    <style type="less">
        @import "../styles/font-awesome/font-awesome.less";
        .overlay{
            height: 100%;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
        a{
            cursor: default;
        }
        }
    </style>
</menu>