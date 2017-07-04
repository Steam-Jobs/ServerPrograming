require('../tags/windows/ajaxtest.tag')
require('../tags/windows/detailList.tag')
require('../tags/windows/detailTask.tag')
require('../tags/windows/message.tag')
require('../tags/login.tag')

<window>
    <!--<div class="overlay" if={ current != "" } onclick="{ closeWindow }">-->
        <div class="overlay" if={ current != "" } >
            <detailTask if={ current == "detailTask" } task={ task }></detailTask>
            <detailList if={ current == "detailList" } list={ list }></detailList>
            <message if={ current == "message" } message={ message }></message>
            <ajaxtest if={ current == "ajaxtest" } onclick=""></ajaxtest>
            <login if={ current == "login" }></login>
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
                this.obs.on('hiddenWindow',function(){
                    that.current = ""
                    that.update()
                })
                this.obs.on('showTask',function(task){
                    that.current = "detailTask"
                    that.task = task
                    that.update()
                })
                this.obs.on('detailList',function(list){
                    that.current = "detailList"
                    that.list = list
                    that.update()
                })
                this.obs.on('showMessage',function(message){
                    that.current = "message"
                    that.message = message
                    that.update()
                })
                this.obs.on('ajaxtest',function(){
                    that.current = "ajaxtest"
                    that.update()
                })
            }
        }
        // オブジェクトを共有部分に登録
        riot.mixin("window",OptsMixin)

        closeWindow(){
            route("/")
        }

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
</window>