<window>
    <div class="overlay">
        <div if={ "detailTask" == riot.mixin('window').getCurrent }><detailTask>aaaa</detailTask></div>
        <div if={ "detailList" == riot.mixin('window').getCurrent }><detailList></detailList></div>
    </div>

    <script>
        console.log(this)
        var OptsMixin = {
            init: function() {
                this.current = current
            },

            getCurrent: function() {
                return this.current
            },

            setCurrent: function(current) {
                this.current = current
                riot.update()
                console.log(this)
                return this
            }
        }
        riot.mixin('window', OptsMixin)
    </script>

    <style type="less">
        .overlay{
            height: 100%;
            width: 100%;
            position: fixed;
        }
    </style>
</window>