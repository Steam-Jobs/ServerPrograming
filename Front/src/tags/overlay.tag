<overlay>
    <div class="overlay" style="display: none">
        <div class="window">
            リスト🙌
            { title }
        </div>
    </div>
    <script>
        console.log(this)

        obs.on("taskClicked",function(){
            console.log(id)
            $('overlay').css('display','')
        })
    </script>
    <style type="less">
        .overlay{
            background: rgba(0,0,0,.5);
            height: 100%;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
        }
        .window{
            background: #FFFFFF;
            border-radius:3px;
            position:relative;
            margin: 80px auto 0;
            width: 730px;
        }
    </style>
</overlay>