require('../tags/list.tag')
require('../tags/header.tag')

<app>
    <div class="surface">
        <header title="This is Header."></header>
        <div class="main-contents">
            <list each={ opts.columns }></list>
            <list-new></list-new>
        </div>
    </div>
    <script>
        this.on('mount', function () {
        })
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
        }
        .surface{
            height: 100%;
        }
        .main-contents{
            position: relative;
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