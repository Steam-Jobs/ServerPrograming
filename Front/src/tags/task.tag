<task>
    <div class="task">
        <div class="task-name">
            <a href="#">{ title }</a>
        </div>
        <div class="task-progress">
            <meter value="{ progress }" min="0" max="100"></meter>
            <span>{ progress }%</span>
        </div>
        <div class="task-comment">
            { comment }
        </div>
    </div>

        <script>
            dateCheck(date)
            {
                if (date) {
                    return ", " + date.toDateString()
                }
            }
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