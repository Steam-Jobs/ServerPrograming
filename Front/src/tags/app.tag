require('../tags/list.tag')
<app>
    <list each={ opts.columns }></list>
    <list-new></list-new>
</app>

<list-new>
    <form onsubmit={ add }>
        <input ref="input" onkeyup={ edit }>
        <button disabled={ !text }>えいっ（適当）</button>
    </form>

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