require('../tags/windows/detailTask.tag')
require('../tags/windows/message.tag')
require('../tags/login.tag')


<window>
    <div class="overlay" if={ current != "" }>
        <a href="/">
            <detailTask if={ current == "detailTask" } task={ task }></detailTask>
            <detailList if={ current == "detailList" } list={ list }></detailList>
            <message if={ current == "message" } message={ message }></message>
            <login if={ current == "login" }></login>
        </a>
    </div>
    <script>
        var that = this
        this.current = ""

        var OptsMixin = {
            obs: riot.observable(),
            init:function(){
                this.obs.on('hiddenWindow',function(){
                    that.current = ""
                    that.update()
                })
                this.obs.on('showTask',function(task){
                    that.current = "detailTask"
                    that.task = task
                    that.update()
                })
                this.obs.on('showList',function(list){
                    that.current = "detailTask"
                    that.list = list
                    that.update()
                })
                this.obs.on('showMessage',function(message){
                    that.current = "message"
                    that.message = message
                    that.update()
                })
            }
        }
        riot.mixin("window",OptsMixin)

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