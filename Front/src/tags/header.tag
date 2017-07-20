<header>

    <div class="header pure-g">
        <div class="pure-u-1-3">
            <a href="/ajax" class="pure-menu-heading header-left header-button header-padding"><i class="fa fa-fw fa-home" aria-hidden="true"></i>ホーム</a>
        </div>
        <div class="pure-u-1-3">
            <a href="/" class="pure-menu-heading header-title">🙌🙌🙌進捗トレ郎🙌🙌🙌</a>
        </div>
        <div class="pure-u-1-3">
            <span onclick={ showInfo } class="pure-menu-heading header-right header-button header-padding"><i class="fa fa-fw fa-info" aria-hidden="true"></i></span>
            <span onclick={ showUser } class="pure-menu-heading header-right header-button"><img class="avatar" src="http://gravatar.com/avatar/{ opts.data.gravatar }?s=30"><span class="header-padding">{ opts.data.userName }</span></span>
            <span onclick={ changeTheme } id="0" class="pure-menu-heading header-right header-padding themebtn theme0btn"></span>
            <span onclick={ changeTheme } id="1" class="pure-menu-heading header-right header-padding themebtn theme1btn"></span>
            <span onclick={ changeTheme } id="2" class="pure-menu-heading header-right header-padding themebtn theme2btn"></span>
        </div>
    </div>

    <script>
        var that = this
        var app = this.parent

        // menu(ポップアップウィンドウ)を制御する変数
        var menu
        this.on('mount',function () {
            // mixinからwindowを取得
            menu = that.mixin("menu")
        })

        showInfo(){ route("info") }
        showUser(){
            menu.obs.trigger("usermenu")
        }

        changeTheme(e){
            app.theme = !!e.target.id ? e.target.id : e.target.parentElement.id
            console.log(!!e.target.id ? e.target.id : e.target.parentElement.id)
            app.update()
        }

    </script>

    <style type='less'>
        @import "../styles/colors";
        @import "../styles/font-awesome/font-awesome.less";

        .header {
            background-color: @blue;
            padding: 5px 0;
            .header-left{
                float:left;
                margin-left:5px;
                .header-item;
            }
            .header-title{
                text-align: center;
                bottom: 0;
                display: block;
                left: 50%;
                margin-left: -40px;
                top: 5px;
                background: 0;
                color:rgba(255,255,255,.6);
                &:hover{
                   color: rgba(255,255,255,.85);
                }
            }
            .header-right {
                float: right;
                margin-right:5px;
            }
        }
        .header-item{
            height:30px;
            line-height:30px;
            padding:0 5px;
        }
        .header-button{
            border-radius: @radius;
            color: @text-w;
            padding: 0;
            background: linear-gradient(to bottom,rgba(255,255,255,.2) 0,rgba(255,255,255,.1) 100%);
        &:hover{
             background: linear-gradient(to bottom,rgba(255,255,255,.3) 0,rgba(255,255,255,.2) 100%);
         }
        }
        .header-padding{
            padding: .5em;
            float: right;
        }
        .avatar{
            height:30px;
            float:left;
            border-top-left-radius: 3px;
            border-bottom-left-radius: 3px;
        }
        .themebtn{
            width:30px;
            height:30px;
            padding:0;
            border-radius:3px;
            &:hover{
                 background: linear-gradient(to bottom,rgba(255,255,255,.3) 0,rgba(255,255,255,.2) 100%);
             }
         }
    </style>

</header>