require('../tags/detailTask.tag')

<window>
    <div class="overlay" if={ current !=　"" }>
        <detailTask if={ current == "detailTask" }></detailTask>
        <detailList if={ current == "detailList" }></detailList>
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
                this.obs.on('taskClicked',function(id){
                    that.current = "detailTask"
                    that.update()
                })
            }
        }
        riot.mixin("window",OptsMixin)

    </script>

    <style type="less">
        .overlay{
            height: 100%;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
        }
    </style>
</window>