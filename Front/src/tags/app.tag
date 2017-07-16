require('../tags/header.tag')
require('../tags/window.tag')
require('../tags/main-contents.tag')

<app>
    <div class="surface">
        <header></header>
        <main-contents></main-contents>
    </div>
    <window></window>

    <script>
        var that = this

        // window(オーバーレイウィンドウ)を制御する変数
        var window
        this.on('mount',function () {
            // mixinからwindowを取得
            window = that.mixin("window")
        })

        // ここからルーター（URLに応じてwindowを制御）
        route.base("/");

        // タスク詳細
        route('t/*', function(id) {
            var tas
            that.data.lists.filter(function(list, index){
                 if(list.tasks.filter(function(task,index){
                    if(task.taskID == id) {
                        tas = task
                        return true
                    }}))
                    return true
            })
            window.obs.trigger("showTask",tas)
        })

        // リスト追加画面
        route('list/add', function(){
            window.obs.trigger("showMessage","リスト追加がめーん")
        })

        // リストにタスク追加
        route('list/*/addtask', function(id){
            window.obs.trigger("showTask")
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
