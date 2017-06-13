<header>

    <div class="header pure-g">
        <div class="pure-u-1-3">
            <a href="#" class="pure-menu-heading header-left header-button"><i class="fa fa-fw fa-home" aria-hidden="true"></i>ホーム</a>
        </div>
        <div class="pure-u-1-3">
            <a href="#" class="pure-menu-heading header-title">タスク管理しすてむ🙌🙌🙌</a>
        </div>
        <div class="pure-u-1-3">
            <span onclick="" class="pure-menu-heading header-right header-button"><i class="fa fa-fw fa-bell-o" aria-hidden="true"></i></span>
            <span onclick={ showInfo } class="pure-menu-heading header-right header-button"><i class="fa fa-fw fa-info" aria-hidden="true"></i></span>
            <span onclick="" class="pure-menu-heading header-right header-button"><img src="http://gravatar.com/avatar/{ data.gravatar }?s=14">{ data.userName }</span>
            <span onclick="" class="pure-menu-heading header-right header-button"><i class="fa fa-fw fa-plus" aria-hidden="true"></i></span>
        </div>
    </div>

    <script>

        showInfo(){ route("info") }

    </script>

    <style type='less'>
        @import "../styles/colors";
        @import "../styles/font-awesome/font-awesome.less";

        .header {
            background-color: @blue;
            padding: 5px 0;
            span{
                padding: .5em;
            }
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
            background: linear-gradient(to bottom,rgba(255,255,255,.2) 0,rgba(255,255,255,.1) 100%);
            &:hover{
             background: linear-gradient(to bottom,rgba(255,255,255,.3) 0,rgba(255,255,255,.2) 100%);
            }
        }
    </style>

</header>