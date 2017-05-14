<task>
    <div class="task">
        <a href="/t/{id}">
            <div class="task-name">
                { title }
            </div>
            <div class="task-progress">
                <meter value="{ progress }" min="0" max="100"></meter>
                <span>{ progress }%</span>
            </div>
            <div class="task-comment">
                { comment }
            </div>
        </a>
    </div>

        <script>

            detailTask(){
                console.log(this.id)
            }
            dateCheck(date)
            {
                if (date) {
                    return ", " + date.toDateString()
                }
            }

            route.base("/");
            route('t/*', function(id) {
                /*riot.mount('app', {
                    columns: [{
                        title: 'リスト1',
                        items: [
                            {id: 1, title: 'タスク 1', progress: 50, date: new Date()},
                            {id: 2, title: 'タスク 2', progress: 25, comment: "コメント1"},
                            {id: 3, title: 'タスク 3', progress: 10, comment: "コメント2"},
                            {id: 4, title: 'タスク 3', progress: 10, comment: "コメント2"},
                        ]
                    },
                        {
                            title: 'リスト2',
                            items: [
                                {id: 5, title: 'タスク2 1', progress: 70, date: new Date()},
                                {id: 6, title: 'タスク2 2', progress: 20, comment: "コメント3"},
                                {id: 7, title: 'タスク2 3', progress: 5, comment: "コメント4"}
                            ]
                        }
                    ]})
                riot.update();*/
                riot.mixin('window').setCurrent("detailTask")
            });
            route.start(true);

        </script>

        <style type='less'>
            .task {
                background: rgba(255, 255, 255, 0.5);
                border-radius: 3px;
                cursor: pointer;
                padding:7px;
                margin-bottom :7px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.26);

                &:hover {
                     background: rgba(255, 255, 255, 0.8);
                }

                .task-name {
                    position: relative;
                    padding-bottom:5px;
                    a{
                        color: #a44cc7;
                    }
                }

                .task-progress{
                    position: relative;
                    margin-bottom:18+5px;
                    meter{
                        height: 18px;
                        width:100%;
                        position: absolute;
                    }
                    span{
                        line-height:18px;
                        width:100%;
                        position: absolute;
                        text-align: center;
                    }
                }
                .task-comment {
                    position: relative;
                }

            }
        </style>
</task>