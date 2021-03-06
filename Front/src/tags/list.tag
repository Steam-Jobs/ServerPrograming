require('../tags/task.tag')

<list>
    <div class="list-header">
        <h2>{ taskListName }</h2>
        <span class="right">
            <span class="list-button" onclick={ detailList }><i class="fa fa-fw fa-cog" aria-hidden="true"></i></span>
        </span>
    </div>
    <div class="list-tasks">
        <task each={ tasks }></task>
    </div>
    <div class="list-bottom">
        <span class="list-button" onclick={ addTask }><i class="fa fa-fw fa-plus" aria-hidden="true"></i></span>
    </div>

    <script>

        edit(e)
        {
            this.text = e.target.value
        }

        add(e)
        {
            if (this.text) {
                this.items.push({title: this.text, progress: 0, comment: "コメント"})
                this.text = this.refs.input.value = ''
            }
        }

        addTask(){ route("/list/"+this.taskListID+"/addtask") }

        detailList(){ route("/list/"+this.taskListID) }

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
            border-radius: 7px;
            border: 1px solid rgba(0, 0, 0, 0.5);
            box-shadow: 0 0 7px -1px rgba(0, 0, 0, 0.5);

        }

        .list-header {
            padding: 5px 10px;

            h2 {
                color: #e0e0e0;
                margin: 0;
                display: inline;
                font-size:21px;
            }
            .right{
                float: right;
                font-size:21px;
            }
            .list-button{
                border-radius:3px;
                background:rgba(0,0,0,.0);
                &:hover{
                     background:rgba(0,0,0,.3);
                }
                a{
                    color: #e0e0e0;
                }
            }
        }
        .list-tasks {
            padding: 0 8px;
            overflow-x: hidden;
        }

        .list-bottom {
            padding: 0 8px;
            margin-bottom: 10px;
        }


    </style>
</list>