require('../tags/header.tag')
require('../tags/window.tag')
require('../tags/menu.tag')
require('../tags/main-contents.tag')

<app>
    <div class="base { "theme"+theme }">
        <div class="surface fadeInUp">
            <header if={ this.data } data={ this.data }> </header>
            <main-contents if={ this.data } data={ this.data }></main-contents>
        </div>
        <window></window>
        <menu></menu>
    </div>
    <script>

        var that = this
        var data
        var theme = 0
        this.data = opts.data

        function GetCookie( name )
        {
            var result = null;

            var cookieName = name + '=';
            var allcookies = document.cookie;

            var position = allcookies.indexOf( cookieName );
            if( position != -1 )
            {
                var startIndex = position + cookieName.length;

                var endIndex = allcookies.indexOf( ';', startIndex );
                if( endIndex == -1 )
                {
                    endIndex = allcookies.length;
                }

                result = decodeURIComponent(
                    allcookies.substring( startIndex, endIndex ) );
            }

            return result;
        }
        // cookieにuseridがなければログイン画面へGO
        if(GetCookie("userid")==null){
            location.href = "/login.html";
        }
        var userid = GetCookie("userid")
        var req = new XMLHttpRequest()

        req.onreadystatechange = function () {
            if (req.readyState === 4) { // 通信の完了時
                if (req.status === 200) { // 通信の成功時
                    console.log("通信成功 "+req.status)
                    data = req.responseText
                    that.data = JSON.parse(data).data
                    that.update()
                } else {
                    console.log("エラー" + req.responseText)
                }
            } else {
            }
        }

        dataGet(){
            console.log("dateGet")
            $.post('http://150.95.149.0/api/sp/Home', 'userID='+userid, function(res) {
                that.data = res.data
                that.update()
            })

            /*
            console.log("dataget")
            req.open('POST', 'http://150.95.149.0/api/sp/Home', true)
            req.setRequestHeader('content-type', 'application/x-www-form-urlencoded;charset=UTF-8')
            req.send('userID=id')
            data = req.responseText
            that.data = JSON.parse(data).data
            that.update()
*/
        }
        dataPush(){
            console.log("datePush")
            $.post('http://150.95.149.0/api/sp/Update',JSON.stringify(that.data), function(res) {
                that.dataGet()
            })
            /*
            req.open('POST', 'http://150.95.149.0/api/sp/Update', true)
            req.setRequestHeader('content-type','application/json;charset=UTF-8')
            req.send(JSON.stringify(that.data))
            */
        }
        if(!data || data=="null"){
            this.dataGet();
        }

        // window(オーバーレイウィンドウ)を制御する変数
        var window

        this.on('mount',function () {
            // mixinからwindow制御オブジェクトを取得
            window = that.mixin("window")
            that.theme = 0
            that.update()
        })
        // ここからルーター（URLに応じてwindowを制御）
        route.base("/");

        // タスク詳細
        route('t/*', function(id) {
            var tas
            var listid
            that.data.lists.filter(function(list, index){
                if(list.tasks.filter(function(task,index){
                        if(task.taskID == id) {
                            tas = task
                            listid = list.taskListID
                            return true
                        }}))
                    return true
            })
            tas['parentListID']=listid
            window.obs.trigger("showTask",tas)
        })

        // リスト追加画面
        route('list/add', function(){
            var newid = 0
            that.data.lists.filter(function(list, listindex){
                if(list.taskListID > newid) {
                    newid = list.taskListID
                }
            })
            newid++
            var newlist = {
                "auto": false,
                "taskListColor": -1,
                "dispByColor": 0,
                "dispByDead": -1,
                "dispByProg": -1,
                "dispByStart": -1,
                "dispUnFinished": false,
                "hidByDead": false,
                "hidByFinished": false,
                "hidByList": null,
                "hidByStart": -1,
                "taskListName": "新規リスト",
                "sortRule": 0,
                "taskListID": newid,
                "tasks": [],
                "newlist":true
            }
            newlist["listlist"]=that.data.lists
            window.obs.trigger("detailList",newlist)
        })

        // リストにタスク追加
        route('list/*/addtask', function(id){
            var newtask = {
                "taskColor": -1,
                "comment": "",
                "creationDate": null,
                "deadlineDate": null,
                "description": "",
                "taskName": "新規タスク",
                "priority": 0,
                "progressDenominator": null,
                "progressNumerator": null,
                "startDate": null,
                "taskID": -1,
                "userID": that.data.userID,
                "parentListID":id
            }
            window.obs.trigger("showTask",newtask)
        })

        // リスト詳細
        route('list/*', function(id){
            var lis
            that.data.lists.filter(function(list, index){
                if(list.taskListID == id) {
                    lis = list
                    return true
                }
                return true
            })
            lis["listlist"]=that.data.lists
            window.obs.trigger("detailList",lis)
        })

        // リスト詳細
        route('info', function(){
            window.obs.trigger("showMessage","タスク管理システム by Steamjobs")
        })

        // リスト詳細
        route('ajax', function(){
            window.obs.trigger("ajaxtest")
        })

        // ログイン詳細
        route('login', function(){
            route("login.html")
            location.reload();
        })
        // ログイン詳細
        route('login#*', function(){
            route("login.html")
            location.reload();
        })

        // ログアウト
        route('logout', function(){
            document.cookie = "userid=; expires=" + new Date('1999-12-31T23:59:59Z').toUTCString();
            document.cookie = "userid=; max-age=0";
            route("login.html")
            location.reload();
        })

        // ログアウト
        route('profile', function(){
            window.obs.trigger("profile")
        })

        // ホーム画面
        route('', function(){
            window.obs.trigger("hiddenWindow")
        })

        route.start(true)

    </script>

    <style type='less'>
        @import "../styles/font-awesome/font-awesome.less";
        app {
            display: block;
            position: relative;
            height: 100%;
            overflow-x: auto;
            overflow-y: hidden;
            width: 100%;
            white-space: nowrap;
        }
        .surface{
            height: 100%;
        }
    </style>
</app>
