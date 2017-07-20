<task>
    <span class="taskcolor" ref="taskcolor" if={ taskColor > -1 }></span>
    <div class="task" ref="task" onclick={ detailTask }>
        <div class="task-name">
            { taskName }
        </div>
        <div class="task-progress" if={ progressNumerator }>
            <meter value="{ progressNumerator }" min="0" max="{ progressDenominator }"></meter>
            <span>{ progressNumerator }{ progressDenominator == 100 ? "%" :" / "+progressDenominator  }</span>
        </div>
        <div class="task-comment">
            { comment }
        </div>
    </div>

        <script>
            var that =this
            var colors=["color0","color1","color2","color3","color4"]
            this.on('mount',function () {
                if(that.taskColor > -1) {
                    that.refs.taskcolor.style.height = that.refs.task.offsetHeight + "px"
                    that.taskColor > -1 ? that.refs.taskcolor.classList.add(colors[that.taskColor]) : ""
                    that.update()
                }
            })
            detailTask(){ route("/t/"+this.taskID) }
        </script>

        <style type='less'>
            .task {
                border-radius: 3px;
                cursor: pointer;
                padding:7px;
                margin-bottom :7px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.26);



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
            .taskcolor{
                position:absolute;
                width:8px;
                border-top-left-radius: 3px;
                border-bottom-left-radius: 3px;
            }
        </style>
</task>