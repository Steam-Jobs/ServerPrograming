<detailTask>
    <div class="window">
        <div class="window-header">
            <label class="edit-title" onclick={ editText }>{ opts.task ? opts.task.taskName:"タスク名を入力" }</label>
            <input class="edit-title" ref="taskName" onblur={ editedText } value={ opts.task.taskName } hidden>
            <a href="/"><i class="fa fa-fw fa-times fa-2x" aria-hidden="true"></i></a>
        </div>
        <div class="window-detail">
            <div class="detail-l">
                <div class="items">
                    <label class="split">タスクコメント</label>
                    <textarea ref="comment" onkeyup={ edit }>{ opts.task.comment }</textarea>
                </div>
                <div class="items">
                    <label class="split">タスク詳細</label>
                    <textarea ref="description" class="comment" onkeyup={ edit }>{ opts.task.description }</textarea>
                </div>
            </div>
            <div class="detail-r">
                <span class="checkbox"><input type="checkbox" ref="progresschk" class="chkbox" onclick={ update } checked={ !!opts.task.progressDenominator } /><label onclick={ labelClicked }>進捗度</label><input type="number" ref="numerator" class="numinput" min="0" value={ opts.task.progressNumerator } disabled={ !refs.progresschk.checked }/></span>
                <div class="radioitems">
                    <span class="checkbox"><input type="radio" ref="radiobox1" class="chkbox" onclick={ update } name="num" disabled={ !refs.progresschk.checked }/><label>100%表示</label></span>
                    <span class="checkbox"><input type="radio" ref="radiobox2" class="chkbox" onclick={ update } name="num" disabled={ !refs.progresschk.checked }/><label>分母を設定</label><input type="number" ref="denominator" class="numinput" min="0" value={ opts.task.progressDenominator !=100 ? opts.task.progressDenominator : ""} disabled={ !refs.progresschk.checked || !refs.radiobox2.checked }/></span>
                </div>
                <span class="checkbox"><input type="checkbox" ref="startchk" class="chkbox" onclick={ update }/><label onclick={ labelClicked }>開始日時</label></span>
                <span class="date"><input type="datetime-local" ref="startDate" class="dateinput" value={ converttime } disabled={ !refs.startchk.checked }></span>
                <span class="checkbox"><input type="checkbox" ref="deadlinechk" class="chkbox" onclick={ update }/><label onclick={ labelClicked }>締め切り日時</label></span>
                <span class="date"><input type="datetime-local" ref="deadlineDate" class="dateinput" disabled={ !refs.deadlinechk.checked }/></span>
                <label>タスクカラー</label>
                <span class="checkbox">
                    <i if={ opts.task.taskColor!="-1" } onclick={ colorchange } class="fa fa-square-o fa-2x" aria-hidden="true" id="-1"></i><i if={ opts.task.taskColor=="-1" } class="fa fa-check-square-o fa-2x" aria-hidden="true"></i>
                    <i if={ opts.task.taskColor!="0" } onclick={ colorchange } class="fa fa-square fa-2x color0" aria-hidden="true" id="0"></i><i if={ opts.task.taskColor=="0" } class="fa fa-check-square fa-2x color0" aria-hidden="true"></i>
                    <i if={ opts.task.taskColor!="1" } onclick={ colorchange } class="fa fa-square fa-2x color1" aria-hidden="true" id="1"></i><i if={ opts.task.taskColor=="1" } class="fa fa-check-square fa-2x color1" aria-hidden="true"></i>
                    <i if={ opts.task.taskColor!="2" } onclick={ colorchange } class="fa fa-square fa-2x color2" aria-hidden="true" id="2"></i><i if={ opts.task.taskColor=="2" } class="fa fa-check-square fa-2x color2" aria-hidden="true"></i>
                    <i if={ opts.task.taskColor!="3" } onclick={ colorchange } class="fa fa-square fa-2x color3" aria-hidden="true" id="3"></i><i if={ opts.task.taskColor=="3" } class="fa fa-check-square fa-2x color3" aria-hidden="true"></i>
                    <i if={ opts.task.taskColor!="4" } onclick={ colorchange } class="fa fa-square fa-2x color4" aria-hidden="true" id="4"></i><i if={ opts.task.taskColor=="4" } class="fa fa-check-square fa-2x color4" aria-hidden="true"></i>
                </span>
                <button class="wbtn" onclick={ removeTask } hidden={ opts.task.taskID==-1 } >削除</button>
                <button class="wbtn" onclick={ updateTask }>{ opts.task.taskID==-1 ? "作成":"更新" }</button>
            </div>
        </div>
    </div>
    <script>
        var app = this.parent.parent
        var that=this;

        this.on('mount',function () {
            this.refs.startDate.value = psdate2inputdate(opts.task.startDate)
            this.refs.deadlineDate.value = psdate2inputdate(opts.task.deadlineDate)
            this.refs.startchk.checked = !!this.refs.startDate.value
            this.refs.deadlinechk.checked = !!this.refs.deadlineDate.value
            this.update()
        })

        colorchange(e){
            opts.task.taskColor = e.target.id
            that.update()
        }

        labelClicked(e)
        {
            e.target.previousElementSibling.checked = !e.target.previousElementSibling.checked
        }
        editText(e){
            e.target.hidden = true
            e.target.nextElementSibling.hidden=false
            e.target.nextElementSibling.focus()
        }
        editedText(e){
            opts.task.taskName = e.target.value
            e.target.hidden = true
            e.target.previousElementSibling.hidden=false
        }
        removeTask(){
            var tasindex
            var lisindex
            app.data.lists.filter(function(list, listindex){
                if(list.tasks.filter(function(task,taskindex){
                        if(task.taskID === opts.task.taskID) {
                            tasindex = taskindex
                            lisindex = listindex
                            return true
                        }}))
                    return true
            })
            app.data.lists[lisindex].tasks.splice( tasindex, 1 )
            app.dataPush()
            route("/")
        }
        updateTask(){
            var task ={
                "taskColor": opts.task.taskColor,
                "comment": this.refs.comment.value,
                "creationDate": inputdate2psdate("new"),
                "deadlineDate": this.refs.deadlinechk.checked ? inputdate2psdate(this.refs.deadlineDate.value) : null,
                "description": this.refs.description.value,
                "taskName": this.refs.taskName.value,
                "priority": 0,
                "progressDenominator": !this.refs.progresschk.checked ? null : this.refs.radiobox1.checked ? 100 : !!this.refs.denominator.value ? this.refs.denominator.value : null,
                "progressNumerator": this.refs.progresschk.checked ? this.refs.numerator.value : null,
                "startDate": this.refs.startchk.checked ? inputdate2psdate(this.refs.startDate.value) : null,
                "taskID": opts.task.taskID,
                "userID": app.data.userID,
            }
            var tasindex
            if(opts.task.taskID !== -1) {
                app.data.lists[opts.task.parentListID].tasks.filter(function (task, taskindex) {
                    if (task.taskID === opts.task.taskID) {
                        tasindex = taskindex
                        return true
                    }
                })
                if (opts.task.taskID === app.data.lists[opts.task.parentListID].tasks[tasindex].taskID) {
                    app.data.lists[opts.task.parentListID].tasks.splice(tasindex, 1);
                }
            }
            app.data.lists[opts.task.parentListID].tasks.push(task)
            app.dataPush()
            route("/")
        }
        function inputdate2psdate(date){
            if(date ==="new")
                date = new Date()
            if(date ===null)
                return ""
            // Jul 15, 2017 9:19:24 PM
            var d = new Date(date.toString().replace(/^(.{10})./,"$1\ "))
            var year = d.getFullYear() ;
            var month = [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul" , "Aug" , "Sep" , "Oct", "Nov", "Dec"][d.getMonth()];
            var day = d.getDate() ;
            var hour = d.getHours() > 12 ? d.getHours()-12 : d.getHours();
            var minute = ("0"+d.getMinutes()).slice(-2);
            var second = ("0"+d.getSeconds()).slice(-2);
            var ampm = d.getHours() > 12 ? "PM" : "AM";
            var psdate = month+" "+day+", "+year+" "+hour+":"+minute+":"+second+" "+ampm
            return psdate
        }
        function psdate2inputdate(date){
            //2017-07-20T00:00
            if(date ===null)
                return ""
            // Jul 15, 2017 9:19:24 PM
            var d = new Date()
            var monthmap = { "Jan":0, "Feb":1, "Mar":2, "Apr":3, "May":4, "Jun":5, "Jul":6 , "Aug":7 , "Sep":8 , "Oct":9, "Nov":10, "Dec":11}
            d.setFullYear(date.split(" ")[2])
            d.setMonth(monthmap[date.split(" ")[0]])
            d.setDate(date.split(" ")[1].slice( 0, -1 ))
            var hours = date.split(" ")[4] === "PM" ? parseInt(date.split(" ")[3].split(":")[0]) + 12:date.split(" ")[3].split(":")[0]
            hours = hours == 24 ? 0 : hours
            d.setHours(hours)
            d.setMinutes(date.split(" ")[3].split(":")[1])
            d.setSeconds(date.split(" ")[3].split(":")[2])
            var YYYY = d.getFullYear().toString()
            var MM = ("0"+d.getMonth()).slice(-2);
            var DD = ("0"+d.getDate()).slice(-2);
            var dayofweek = ['S', 'M', 'T', 'W', 'T', 'F', 'S'][d.getDay()]
            var hh = ("0"+d.getHours()).slice(-2);
            var mm = ("0"+d.getMinutes()).slice(-2);
            return YYYY+"-"+MM+"-"+DD+dayofweek+hh+":"+mm
        }
    </script>

    <style type="less">
        .window {
            width: 520px;
            height: 400px;
            margin:80px auto 0;
            padding:0 10px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 5px;
        }
        .window-header{
            width:100%;
            margin-top: 5px;
            height: 2em;
            float: right;
            margin-bottom:5px;
            font-weight:bold;
            .edit-title{
                width:75%;
                overflow: hidden;
                height:1em;
                line-height: 1em;
                padding:.5em 0;
                float:left;
                resize:none;
            }
            label:hover{
                border-radius:3px;
                background: #cccccc;
            }
            a{
                float: right;
            }
        }
        .window-detail{
            float: left;
            label{
                float:left;
                height: 2.5em;
                line-height: 2.5em;
            }
            input{
                width:90%;
                padding: .5em .6em;
                border: 1px solid #ccc;
                box-shadow: inset 0 1px 3px #ddd;
                border-radius: 4px;
                font: inherit;
                display: block;
            }
            textarea{
                height:4em;
                width:100%;
                display: block;
                max-width:  90%;
                max-height: 14em;
            }
            .comment{
                height:8em;
            }
            .split{
                height: auto;
                width:100%;
                line-height: 1.5em;
                border-bottom:#174d7a solid 1px;
                padding:0;
                margin-bottom:1em;
            }
            .date{
                width:100%;
                float: left;
            }
            .checkbox{
                width:100%;
                float: left;
                height: 2em;
                line-height: 2em;
                label{
                    width:auto;
                }
                .chkbox{
                    float:left;
                    width:auto;
                    margin:.75em .5em 0;
                }
                select{
                    margin-top:.5em;
                }
                .numinput{
                    height: 1.5em;
                    width:3.5em;
                    float:none;
                    margin:0;
                    padding:0;
                    padding-left: .5em;
                }
                i{
                    margin-right: 5px;
                    background:none;
                }
            }
        .items{
            float: left;
            width: 100%;
            padding-right: 10px;
            margin-bottom:1em;
        }
        .radioitems{
            float: left;
            margin-left:1em;
        }
        .dateinput{
            height: 1em;
            margin:.5em;
            width:13em;
        }
        .wbtn{
            float:right;
            margin-left: 10px;
            margin-top:10px;
            background-color: rgba(2, 106, 167,1);
            border-radius: 3px;
            color: #e8e8e8;
            padding: 10px 20px;
            &:hover{
                 background-color: rgba(2, 106, 167,.6);
             }
        }
            .detail-l{
                float:left;
                width:58%;
                padding-right:2%;
            }
            .detail-r{
                float:left;
                width:40%;
            }
        }
    </style>
</detailTask>