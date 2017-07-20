<usermenu onclick={ closemenu }>
    <h1></h1>
    <div class="list">
        <ul class="menu">
            <a href="/profile"><li>プロフィール</li></a>
            <a href="/logout"><li>ログアウト</li></a>
        </ul>
    </div>
    <script>
        var that = this
        var menu
        this.on('mount',function () {
            // mixinからwindowを取得
            menu = that.mixin("menu")
        })

        closemenu(){
            menu.obs.trigger("hiddenMenu")
        }
    </script>
    <style type="less">
        .list{
            position: absolute;
            top: 42px;
            right: 0;
            width: 200px;
            border-radius: 3px;
            background: rgba(237, 237, 237, .8);
            box-shadow: 0 0 7px -1px rgba(0, 0, 0, 0.5);
        }
        .menu{
            padding:0;
            margin:0;
            li{
                padding:5px 10px;
                &:hover{
                    background: #e8e8e8;
                }
                &:first-child{
                     border-top-left-radius: 3px;
                     border-top-right-radius: 3px;
                }
                &:last-child{
                     border-bottom-left-radius: 3px;
                     border-bottom-right-radius: 3px;
                }
            }
        }
    </style>
</usermenu>