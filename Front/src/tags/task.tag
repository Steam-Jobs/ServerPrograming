<task>
    <div class="task">
        <div class="task-name">
            <a href="#">{ title }</a>
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
            
                .task-name {
                    position: relative;
                    padding-bottom:5px;
                    a{
                        color: #a44cc7;
                    }
                }

                .task-comment {
                    position: relative;
                }

            }
        </style>
</task>