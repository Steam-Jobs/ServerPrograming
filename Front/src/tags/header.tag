<header>

    <div class="menu-head pure-menu pure-menu-horizontal">
        <a href="#" class="pure-menu-heading menu-title"><i class="fa fa-fw fa-home" aria-hidden="true"></i>タスク管理しすてむ🙌🙌🙌</a>
        <ul class="pure-menu-list">
            <li class="pure-menu-item"><a href="#" class="pure-menu-link">ボタン1</a></li>
            <li class="pure-menu-item"><a href="#" class="pure-menu-link">何らかのボタン2</a></li>
            <li class="pure-menu-item"><a href="#" class="pure-menu-link">何らかのボタン3</a></li>
        </ul>
    </div>

    <style type='less'>
        @import "../styles/colors";
        @import "../styles/font-awesome/font-awesome.less";

        .menu-head {
            background-color: @blue;

            .menu-title{
                .header-button
            }
            ul {
                float: right;
                li{
                    .header-button
                }
            }

        }
        .header-button{
            background: linear-gradient(to bottom,rgba(255,255,255,.2) 0,rgba(255,255,255,.1) 100%);
            color: @text-w;
            &:hover{
             background: linear-gradient(to bottom,rgba(255,255,255,.3) 0,rgba(255,255,255,.2) 100%);
            }
        }
    </style>

</header>