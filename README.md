<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>在测试中</title>
  <!-- HTML -->
  <!-- Custom Styles -->
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="bc.css">
  <style>
    .bc_mbl::before {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      
      /* replace background-image url with your image */
      /* note that if you use a local file as the image you should replace the url like: '/path/to/image'  */
      /*background-image: url(https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187.jpg?w=1272&h=848);*/
      background-size: cover;
      background-position: center;
      filter: blur(20px);
      opacity: 0.8;
      z-index: -1;
    }
  </style>
</head>
<body style="max-width: 768px; margin: auto;">
  <div class="bc_content">
    <div class="bc-fluid">
      <div class="bc-row bc-space10">
        <div class="bc-xs12">
          <div class="bc_mbl bc_box" id="bc_mobile_head">
            <div class="bc-row">
              <div class="bc-xs3">
                <img class="bc_mbl bc_box img-avatar " style="border-radius: 50%;" src="logo.gif">
              </div>
              <div class="bc-xs9">
                <div class="bc-xs12">
                  <div id="bc_name">星河官网</div>
                  <div id="bc_tip">DXQ：相信技术，传递价值！</div>
                </div>
                <div class="bc-xs12">
                  <a class="btn">标签：</a>
                  <a class="btn btn-orange">社牛</a>
                  <a class="btn btn-purple">野王</a>
                  <a class="btn btn-green">可达鸭</a>
                  <a class="btn btn-blue">ฅ՞•ﻌ•՞ฅ</a>
                </div>
                <div class="bc-xs12">
                  <a class="btn">擅长：</a>
                  <a class="btn btn-green">JavaScript</a>
                  <a class="btn btn-yellow">html/css</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="bc-row bc-space10">
        <div class="bc-xs4">
          <div class="bc_box bc_mbl bc_center">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-weixin"></use>
            </svg>
            内容
          </div>
        </div>
        <div class="bc-xs4">
          <div class="bc_box bc_mbl bc_center">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-QQ"></use>
            </svg>
            内容
          </div>
        </div>
        <div class="bc-xs4">
          <div class="bc_box bc_mbl bc_center">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-gitee"></use>
            </svg>
            内容
          </div>
        </div>
      </div>
      <div class="bc-row bc-space10">
        <div class="bc-sm12">
          <div class="bc_box bc_mbl">
            <div class="bc_box bc_mbl">
              <p>如果您喜欢我们的网站，请将本站添加到收藏夹（快捷键<code>Ctrl+D</code>），并<a class="btn btn-green" href="#"
                  target="_blank">设为浏览器主页</a>，方便您的下次访问，感谢支持。
              <p>
            </div>
          </div>
        </div>
      </div>
      <div class="bc-row bc-space10">
        <div class="bc-xs12">
          <div class="bc_box bc_mbl">
            <div class="bc-row">
              <h3 class="bc-xs12 bc_box"><svg class="icon" aria-hidden="true">
                  <use xlink:href="#icon-zhandian"></use>
                </svg>旗下站点</h3>
              <hr>
            </div>
            <div class="bc-row bc-space10" style="word-wrap:break-word;">
              <a href="#" class="bc-xs6 bc-sm4 bc-md4 bc-lg4" target="_blank">
                <div class="bc_a btn-orange bc_center"> <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-lianjie"></use>
                  </svg>链接</div>
              </a>
              <a href="#" class="bc-xs6 bc-sm4 bc-md4 bc-lg4" target="_blank">
                <div class="bc_a btn-orange bc_center"> <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-lianjie"></use>
                  </svg>链接</div>
              </a>
              <a href="#" class="bc-xs6 bc-sm4 bc-md4 bc-lg4" target="_blank">
                <div class="bc_a btn-orange bc_center"> <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-lianjie"></use>
                  </svg>链接</div>
              </a>
              <a href="#" class="bc-xs6 bc-sm4 bc-md4 bc-lg4" target="_blank">
                <div class="bc_a btn-orange bc_center"> <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-lianjie"></use>
                  </svg>链接</div>
              </a>
            </div>
          </div>
        </div>
      </div>
      <div class="bc-row bc-space10">
        <div class="bc-xs12">
          <div class="bc_box bc_mbl">
            <div class="bc-row">
              <h3 class="bc-xs12 bc_box"><svg class="icon" aria-hidden="true">
                  <use xlink:href="#icon-zhandian"></use>
                </svg>友情链接</h3>
              <hr>              
            </div>
            <div class="bc-row bc-space10" style="word-wrap:break-word;">
              <a href="#" class="bc-xs6 bc-sm4 bc-md4 bc-lg4" target="_blank">
                <div class="bc_a btn-orange bc_center"> <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-lianjie"></use>
                  </svg>链接</div>
              </a>
              <a href="#" class="bc-xs6 bc-sm4 bc-md4 bc-lg4" target="_blank">
                <div class="bc_a btn-orange bc_center"> <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-lianjie"></use>
                  </svg>链接</div>
              </a>
              <a href="#" class="bc-xs6 bc-sm4 bc-md4 bc-lg4" target="_blank">
                <div class="bc_a btn-orange bc_center"> <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-lianjie"></use>
                  </svg>链接</div>
              </a>
            </div>
          </div>
        </div>
      </div>
      <div class="bc-row bc-space10">
        <div class="bc-xs12">
          <div class="bc_mbl bc_box" id="bc_foot">
            Copyright © 2023 您的名字
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--免费虚拟机加QQ群681219211领取--柚云数据分享-vpsyou.cn  请不要删这个谢谢  -->
  <!-- Project -->
</body>
</html>
