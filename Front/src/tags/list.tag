require('../tags/task.tag')

<list>
    <div class="list-header">
        <h2>{ title }</h2>
    </div>
    <div class="list-tasks">
            <task each={ items.filter(whatShow) }></task>
    </div>
    <div class="list-bottom">
        <form class="pure-form" onsubmit={ add }>
            <input ref="input" onkeyup={ edit }>
            <button disabled={ !text } class="pure-button pure-button-primary">Add</button>

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
                this.items.push({title: this.text})
                this.text = this.refs.input.value = ''
            }
            e.preventDefault()
        }

        removeItem(e)
        {
            console.log(e)
            e.target.parent
        }

        removeAllDone(e)
        {
            this.items = this.items.filter(function (item) {
                return !item.done
            })
        }

        // an two example how to filter items on the list
        whatShow(item)
        {
            return !item.hidden
        }



        onlyDone(item)
        {
            return item.done
        }

        toggle(e)
        {
            var item = e.item
            item.done = !item.done
            return true
        }

    </script>

    <style type='less'>
        @import "../styles/colors";
        @import "../styles/font-awesome/font-awesome.less";

        list {
            width: 270px;
            display: inline-block;
            vertical-align: top;
            padding: 0;
            margin: 10px 5px 0;
            // background: rgba(0, 0, 0, 0.6);
            border-radius: 7px;
            border: 1px solid rgba(0, 0, 0, 0.5);

            box-shadow:0px 0px 7px -1px rgba(0,0,0,0.5);
            -moz-box-shadow:0px 0px 7px -1px rgba(0,0,0,0.5);
            -webkit-box-shadow:0px 0px 7px -1px rgba(0,0,0,0.5);

        }
        .list-header {
            padding:5px 10px;
            h2 {
                color: #e0e0e0;
                margin:0;
            }
        }
        .list-tasks{
            padding: 0 8px;
        }
        .list-bottom{
            padding: 0 8px;
            margin-bottom: 10px;
        }


    </style>
</list>