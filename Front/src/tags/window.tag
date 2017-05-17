require('../tags/detailTask.tag')

<window>
    <div class="overlay" if={ current !=　"" }>
        <a href="/">
            <detailTask if={ current == "detailTask" } task={ task }></detailTask>
            <detailList if={ current == "detailList" }></detailList>
        </a>
    </div>
    <script>
        var that = this
        this.current = ""

        var OptsMixin = {
            obs: riot.observable(),
            init:function(){
                this.obs.on('hidden',function(){
                    that.current = ""
                    that.update()
                })
                this.obs.on('taskClicked',function(task){
                    that.current = "detailTask"
                    that.task = task
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