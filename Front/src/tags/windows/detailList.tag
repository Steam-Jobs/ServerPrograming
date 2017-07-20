<detailList>
    <div class="window fadeInDown">
        <div class="window-header">
            <label class="edit-title" onclick={ editText }>{ opts.list ? opts.list.taskListName : "リスト名を表示する" }</label>
            <input class="edit-title" ref="taskListName" onblur={ editedText } value={ opts.list.taskListName } hidden>
            <a href="/"><i class="fa fa-fw fa-times fa-2x" aria-hidden="true"></i></a>
        </div>
        <div class="window-detail">
            <label class="split">ソート</label>
            <div class="items">
                <span class="checkbox">
                <select ref="sortRule" value={ opts.list.sortRule }>
                    <option value="0">ソートしない</option>
                    <option value="1">優先度昇順</option>
                    <option value="2">優先度降順</option>
                    <option value="3">締め切り日時近い順</option>
                    <option value="4">締め切り日時遠い順</option>
                    <option value="5">開始切り日時近い順</option>
                    <option value="6">開始切り日時遠い順</option>
                    <option value="7">作成日時昇順</option>
                    <option value="8">作成日時降順</option>
                    <option value="9">進捗度昇順</option>
                    <option value="10">進捗度降順</option>
                </select>
                </span>
                <span class="checkbox"><input type="checkbox" class="chkbox" onclick={ update } ref="auto" checked={ opts.list.auto }/><label onclick={ labelClicked }>リストの自動化</label></span>
            </div>
            <div class="items">
                <label class="split">表示関連</label>
                <span class="checkbox"><input type="checkbox" class="chkbox" onclick={ update } ref="dispByStartchk" checked={ opts.list.dispByStart >= 0 } disabled={ !refs.auto.checked }/><label>開始日時が<input type="number" ref="dispByStart" class="numinput" min="0" value={ opts.list.dispByStart >= 0 ? opts.list.dispByStart: "" } disabled={ !refs.dispByStartchk.checked || !opts.list.dispByStart < 0 || !refs.auto.checked }/>日以内</label></span>
                <span class="checkbox"><input type="checkbox" class="chkbox" onclick={ update } ref="dispByDeadchk" checked={ opts.list.dispByDead >= 0 } disabled={ !refs.auto.checked }/><label>締め切り日時が<input type="number" ref="dispByDead" class="numinput" min="0" value={ opts.list.dispByDead >= 0 ? opts.list.dispByDead: "" } disabled={ !refs.dispByDeadchk.checked || !opts.list.dispByDead < 0 || !refs.auto.checked }/>日以内</label></span>
                <span class="checkbox"><input type="checkbox" class="chkbox" onclick={ update } ref="dispByFinished" checked={ opts.list.dispByFinished } disabled={ !refs.auto.checked }/><label>締め切り後満了していない</label></span>
                <span class="checkbox"><input type="checkbox" class="chkbox" onclick={ update } ref="dispByProgchk" checked={ opts.list.dispByProg >= 0 } disabled={ !refs.auto.checked }/><label>進捗が<input type="number" ref="dispByProg" class="numinput" min="0" value={ opts.list.dispByProg >= 0 ? opts.list.dispByProg: ""  } disabled={ !refs.dispByProgchk.checked || !opts.list.dispByProg < 0 || !refs.auto.checked }/>%以下のものを表示</label></span>
            </div>
                <label class="split">非表示</label>
            <div class="items">
                <span class="checkbox"><input type="checkbox" class="chkbox" onclick={ update } ref="hidByFinished" checked={ opts.list.hidByFinished } disabled={ !refs.auto.checked }/><label>進捗が満了</label></span>
                <span class="checkbox"><input type="checkbox" class="chkbox" onclick={ update } ref="hidByDead" checked={ opts.list.hidByDead } disabled={ !refs.auto.checked }/><label>締め切り日時を超過</label></span>
                <span class="checkbox"><input type="checkbox" class="chkbox" onclick={ update } ref="hidByStartchk" checked={ opts.list.hidByStart >= 0 } disabled={ !refs.auto.checked }/><label>開始日を<input type="number" class="numinput" min="0" value={ opts.list.hidByStart >= 0 ? opts.list.hidByStart: "" } disabled={ !refs.hidByStartchk.checked || !opts.list.hidByStart < 0 || !refs.auto.checked }/>日超過</label></span>
            </div>
                <label class="split">次のリストにあるものを非表示</label>
                <select ref="hidByList" size="2" disabled={ !refs.auto.checked } multiple>
                    <option each={ opts.list.listlist } value={ taskListID } checked={ }>{taskListName}</option>
                </select>
                <label>リストカラー</label>
                <div class="checkbox">
                    <i if={ opts.list.taskListColor!="-1" } onclick={ colorchange } class="fa fa-square-o fa-2x" aria-hidden="true" id="-1"></i><i if={ opts.list.taskListColor=="-1" } class="fa fa-check-square-o fa-2x" aria-hidden="true"></i>
                    <i if={ opts.list.taskListColor!="0" } onclick={ colorchange } class="fa fa-square fa-2x color0" aria-hidden="true" id="0"></i><i if={ opts.list.taskListColor=="0" } class="fa fa-check-square fa-2x color0" aria-hidden="true"></i>
                    <i if={ opts.list.taskListColor!="1" } onclick={ colorchange } class="fa fa-square fa-2x color1" aria-hidden="true" id="1"></i><i if={ opts.list.taskListColor=="1" } class="fa fa-check-square fa-2x color1" aria-hidden="true"></i>
                    <i if={ opts.list.taskListColor!="2" } onclick={ colorchange } class="fa fa-square fa-2x color2" aria-hidden="true" id="2"></i><i if={ opts.list.taskListColor=="2" } class="fa fa-check-square fa-2x color2" aria-hidden="true"></i>
                    <i if={ opts.list.taskListColor!="3" } onclick={ colorchange } class="fa fa-square fa-2x color3" aria-hidden="true" id="3"></i><i if={ opts.list.taskListColor=="3" } class="fa fa-check-square fa-2x color3" aria-hidden="true"></i>
                    <i if={ opts.list.taskListColor!="4" } onclick={ colorchange } class="fa fa-square fa-2x color4" aria-hidden="true" id="4"></i><i if={ opts.list.taskListColor=="4" } class="fa fa-check-square fa-2x color4" aria-hidden="true"></i>
                </div>
                <button class="wbtn" onclick={ removeList } hidden={ !!opts.list.newlist }>削除</button>
                <button class="wbtn" onclick={ updateList }>{!!opts.list.newlist ? "作成":"更新"}</button>
        </div>

    </div>

    <script>
        var app = this.parent.parent
        var that=this;
        labelClicked(e)
        {
            e.target.parentNode.firstElementChild.value = !e.target.parentNode.firstElementChild.value
        }
        editText(e){
            e.target.hidden = true
            e.target.nextElementSibling.hidden=false
            e.target.nextElementSibling.focus()
        }
        editedText(e){
            opts.list.taskListName = e.target.value
            e.target.hidden = true
            e.target.previousElementSibling.hidden=false
        }
        colorchange(e){
            opts.task.taskColor = e.target.id
            that.update()
        }
        removeList(){
            var listindex
            app.data.lists.filter(function(list, index){
                if(list.taskListID === opts.list.taskListID) {
                    listindex = index
                    return true
                }
                return true
            })
            app.data.lists.splice( listindex, 1 )
            app.dataPush()
            route("/")
        }
        updateList(){
            var hidByLis = []
            for (var i=0;i<this.refs.hidByList.selectedOptions.length;i++){
                hidByLis.push(parseInt(this.refs.hidByList.selectedOptions[i].value))
            }
            var list ={
                "taskListID": opts.list.taskListID,
                "taskListName": this.refs.taskListName.value,
                "tasks": [],
                "taskIDList": [],
                "sortRule": parseInt(this.refs.sortRule.value),
                "taskListColor": -1,
                "auto": this.refs.auto.checked,
                "dispByStart": this.refs.dispByStartchk.checked ? this.refs.dispByStart.value : -1,
                "dispByDead": this.refs.dispByDeadchk.checked ? this.refs.dispByDead.value : -1,
                "dispUnFinished": false,
                "dispByProg": this.refs.dispByProgchk.checked ? this.refs.dispByProg.value : -1,
                "dispByColor": 0,
                "hidByFinished": this.refs.hidByFinished.checked,
                "hidByDead": this.refs.hidByDead.checked,
                "hidByStart": -1,
                "hidByList": hidByLis,
            }
            var lisindex
            app.data.lists.filter(function(list, listindex){
                if(list.taskListID === opts.list.taskListID) {
                    lisindex = listindex
                    return true
                }
            })
            if(!!lisindex){
                app.data.lists.splice( lisindex, 1 );
            }
            app.data.lists.push(list)
            console.log(app.data)
            app.dataPush()
            route("/")
        }
    </script>

    <style type="less">
        .window {
            width: 300px;
            height: 650px;
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
                width:100%;
                height: 2.5em;
                line-height: 2.5em;
            }
            select{
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
                    padding:0;
                    padding-left: .5em;
                }
                i{
                    margin-right: 5px;
                    background:none;
                }
            }
            .split{
                height: auto;
                line-height: 1.5em;
                border-bottom:#174d7a solid 1px;
                padding:0;
                margin-bottom:1em;
            }
            .items{
                float: left;
                margin-bottom:1em;
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
        }
    </style>
</detailList>