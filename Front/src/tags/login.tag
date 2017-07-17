<login>
    <video loop autoplay preload="none" id="bgvid">
        <source src="/img/baji.mp4" type="video/mp4">
    </video>
    <div class="page">
        <img src="img/login.png">
    </div>
    <style type="less">
        body{
            background: none;
        }
        video{
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            z-index: -100;
            background-size: cover;

        }
        img{
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            z-index: -10;
            background-size: cover;
        }
        .page{
            position: fixed;
            top: 0;
            left: 0;
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            background: rgba(0,0,0,.5);

        }
    </style>
</login>