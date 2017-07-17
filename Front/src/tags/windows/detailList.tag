<detailList>
    <div class="window">
        <div class="window-header">
            <label class="edit-title" onclick={ editText }>{ opts.list ? opts.list.taskListName : "リスト名を表示する" }</label>
            <input class="edit-title" onblur={ editedText } value={ opts.list.taskListName } hidden>
            <a href="/"><i class="fa fa-fw fa-times fa-2x" aria-hidden="true"></i></a>
        </div>
        <div class="window-detail">
            <label class="split">ソート</label>
            <div class="items">
                <span class="checkbox">
                <select ref="input" value={ opts.list.sortRule }>
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
                <span class="checkbox"><input type="checkbox" class="chkbox" checked={ opts.list.auto }/><label onclick={ labelClicked }>リストの自動化</label></span>
            </div>
            <div class="items">
                <label class="split">表示関連</label>
                <span class="checkbox"><input type="checkbox" class="chkbox"  checked={ opts.list.dispByStart < 1 }/><label>開始日時が<input type="number" class="numinput" min="0" value={ opts.list.dispByStart } disabled={ !opts.list.dispByStart < 0}/>日以内</label></span>
                <span class="checkbox"><input type="checkbox" class="chkbox" checked={ opts.list.dispByDead < 1 }/><label>締め切り日時が<input type="number" class="numinput" min="0" value={ opts.list.dispByDead } disabled={ !opts.list.dispByDead < 0}/>日以内</label></span>
                <span class="checkbox"><input type="checkbox" class="chkbox" checked={ opts.list.dispByFinished }/><label>締め切り後満了していない</label></span>
            </div>
                <label class="split">非表示</label>
            <div class="items">
                <span class="checkbox"><input type="checkbox" class="chkbox" checked={ opts.list.hidByFinished }/><label>進捗が満了</label></span>
                <span class="checkbox"><input type="checkbox" class="chkbox" checked={ opts.list.hidByDead }/><label>締め切り日時を超過</label></span>
                <span class="checkbox"><input type="checkbox" class="chkbox" checked={ opts.list.hidByStart }/><label>締切がなく開始日を超過</label></span>
            </div>
                <label class="split">次のリストにあるものを表示</label>
                <select ref="input" size="2" value={ opts.list.listName } multiple>
                    <!--
                    なしならnull
                    -->
                    <option value="1">リスト1</option>
                    <option value="2">リスト2</option>
                    <option value="3">リスト3</option>
                </select>
                <label>リストカラー</label>
                <button class="wbtn" hidden={ !opts.list }>削除</button>
                <button class="wbtn">{ opts.list ? "更新":"作成" }</button>
        </div>

    </div>

    <script>
        console.log(opts)

        var x = true;
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
    </script>

    <style type="less">
        .window {
            width: 300px;
            height: 580px;
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