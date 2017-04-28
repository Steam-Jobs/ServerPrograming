require('../tags/list.tag')
require('../tags/header.tag')

<app>
    <header title="This is Header."></header>
    <div class="pure-g">
        <list each={ opts.columns }></list>
        <list-new></list-new>
    </div>
</app>

<list-new>
    <div class="pure-u-1-2">
        <form onsubmit={ add }>
            <input ref="input" onkeyup={ edit }>
            <button disabled={ !text }>えいっ（適当）</button>
        </form>
    </div>
    <script>
        this.columns = opts.columns
        edit(e)
        {
            this.text = e.target.value
        }

        add(e)
        {
            if (this.text) {
                this.columns.push({
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