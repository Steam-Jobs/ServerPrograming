require('../tags/list.tag')
require('../tags/header.tag')
require('../tags/window.tag')

<app>
    <div class="surface">
        <header title="This is Header."></header>
        <div class="main-contents">
            <div class="lists">
                <list each={ opts.columns }></list>
                <list-new></list-new>
            </div>
            <div class="sidemenu"></div>
        </div>
    </div>
    <window></window>
    <script>
        var that = this
        var window
        this.on('mount',function () {
            window = that.mixin("window")
        })

        route.base("/");

        route('t/*', function(id) {
            var tas
            opts.columns.filter(function(list, index){
                 if(list.items.filter(function(task,index){
                    if(task.id == id) {
                        tas = task
                        return true
                    }}))
                    return true
            })
            window.obs.trigger("taskClicked",tas)
        })

        route('', function(){
            window.obs.trigger("hidden")
        })

        route.start(true)
    </script>
    <style type='less'>
        app {
            display: block;
            position: relative;
            height: 100%;
            overflow-x: auto;
            overflow-y: hidden;
            width: 100%;
            white-space: nowrap;
        }
        .main-contents{
            height: 100%;
            position: relative;
            padding-bottom:10px;
            overflow-x: auto;
            overflow-y: hidden;
            .lists{
                position: absolute;
                top: 0;
                right: 0;
                bottom: 0;
                left: 0;
                margin-bottom:10px;
                padding-bottom:10px;
            }
        }
        .surface{
            height: 100%;
        }
    </style>
</app>

<list-new>
    <div class="pure-u-1-2">
        <form onsubmit={ add }>
            <input ref="input" onkeyup={ edit }>
            <button>えいっ（適当）</button>
        </form>
    </div>
    <script>

        edit(e)
        {
            this.text = e.target.value
        }

        add(e)
        {
            if (this.text) {
                opts.columns.push({
                    title: this.text,
                    items: [
                        {title: 'Todo 1', date: new Date()},
                        {title: 'Todo 2'},
                        {title: 'Todo 3'}
                    ]
                })
                this.text = this.refs.input.value = ''
            }
            e.preventDefault()
        }

    </script>

</list-new>