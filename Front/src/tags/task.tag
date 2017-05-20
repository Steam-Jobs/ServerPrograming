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