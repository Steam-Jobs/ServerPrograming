require('../tags/list.tag')

<main-contents>
    <div class="main-panel">
        <div class="lists">
            <list each={ opts.data.lists }></list>
            <list-new><span class="list-button" onclick="{ addList }"><i class="fa fa-fw fa-plus" aria-hidden="true"></i></span></list-new>
        </div>
        <div class="sidemenu"></div>
    </div>
    <script>

        addList(){ route("/list/add") }

    </script>
    <style type="less">
        .main-panel{
            height: 100%;
            position: relative;
            padding-bottom:10px;
            overflow: scroll;
        .lists{
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            margin-bottom:10px;
            padding-bottom:10px;
        }
        }
        list-new {
            display: inline-block;
            vertical-align: top;
            padding: 0;
            margin: 10px 5px 0;
            padding: 5px 0;
        }

        .list-button{
            border-radius:3px;
            background:rgba(0,0,0,.0);
            font-size:21px;
            color: #e0e0e0;
        &:hover{
             background:rgba(0,0,0,.3);
         }
        a{
            color: #e0e0e0;
        }
        }
    </style>
</main-contents>