require('../tags/list.tag')

<main-contents>
    <div class="main-contents">
        <div class="lists">
            <list each={ data.lists }></list>
            <list-new></list-new>
        </div>
        <div class="sidemenu"></div>
    </div>
    <style type="less">
        .main-contents{
            height: 100%;
            position: relative;
            padding-bottom:10px;
            overflow-x: auto;
            overflow-y: hidden;
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
    </style>
</main-contents>

<list-new>
    <span class="list-button"><a href="/list/add"><i class="fa fa-fw fa-plus" aria-hidden="true"></i></a></span>
    <style type="less">
        list-new {
            display: inline-block;
            vertical-align: top;
            padding: 0;
            margin: 10px 5px 0;
            padding: 5px 10px;
        }

        .list-button{
            border-radius:3px;
            background:rgba(0,0,0,.0);
            font-size:21px;
            &:hover{
                 background:rgba(0,0,0,.3);
             }
            a{
                color: #e0e0e0;
            }
        }

    </style>

</list-new>