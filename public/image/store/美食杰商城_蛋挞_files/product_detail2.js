var goods_id = getQueryString("goods_id");
var is_first=true;
var shareTitle='';
var shareLink='';
var sharePic='';
var shareContent='';
var kucun = 10;
function connectWebViewJavascriptBridge(callback) {
    if (window.WebViewJavascriptBridge) {
        callback(WebViewJavascriptBridge)
    } else {
        document.addEventListener('WebViewJavascriptBridgeReady', function() {
            callback(WebViewJavascriptBridge)
        }, false)
    }
}
$(function (){
    var is_ios = navigator.userAgent.match(/iPhone/i);
    var is_meishij = navigator.userAgent.match(/meishij/i);
    var pageName = 'shop_recomment/rank/1';
    if(is_meishij){
        if(is_ios){
                connectWebViewJavascriptBridge(function(bridge) {
                    bridge.init(function(message, responseCallback) {
                    // log('JS got a message', message)
                    var data = { 'Javascript Responds':'Wee!' }
                    // log('JS responding with', data)
                    responseCallback(data)
                    });
                    bridge.registerHandler('testJavascriptHandler', function(data, responseCallback) {
                        // log('ObjC called testJavascriptHandler with', data)
                        var responseData = { 'Javascript Says':'Right back atcha!' }
                        // log('JS responding with', responseData)
                        responseCallback(responseData)
                    });
                    var data = '{"type":"9","referer":"'+pageName+'"}';
                    bridge.send(data, function(responseData) {});
                    var data2 = '{"type":"100","jump":"{\\"type\\":\\"100\\",\\"class_name\\":\\"MSGoodsDetailController\\",\\"property\\": {\\"goodsID\\": \\"' + goods_id + '\\"}}"}';
                    bridge.send(data2, function (responseData) {});
                    return false;
                });

        }else{
            $.getScript("//site.meishij.net/data/resource/html5/js/web_app_android.js?v=15",function(){
                if(pageName){
                    doReferer(pageName);
                }
                var data = '{"act":"","i":"","jump":{"type":"1001","class_name":"com.jesson.meishi.ui.store.StoreGoodsDetailActivity","property": {"goods_id": "'+goods_id+'"}}}';
                var json=base64encode(data);
                androidWeb.nativeMethod(json);
                return false;
            });
        }

    }else{
        get_goods_detail(goods_id,true);
    }
});
function get_goods_detail(gid,no_change){
    $.ajax({
        url:ApiUrl+"/index.php?act=goods&op=goods_detail_new",
        type:'get',
        data:{goods_id:gid},
        dataType:'json',
        success:function(result){
            if(result.code==1){
                var result=result.data;
                //商品信息
                var goodsInfo=result.goods_info;
                if(goodsInfo){
                    //加入购物车
                    $("#choose_form .btnw .s,#choose_form .btnw .c").attr('pid',goodsInfo.id);
                    //商品封面图
                    var covers=goodsInfo.covers;
                    var coversHtml='';
                    for(var i in covers){
                        coversHtml+='<div class="swiper-slide"><img src="'+covers[i].media.big+'" class="gd_topimg"></div>';
                        //console.log(covers[i].media);
                        //alert(covers[i].media.type);
                        if(covers[i].media.type=='img'){

                        }else if(covers[i].media.type=='video'){
                            coversHtml+='<div class="swiper-slide">'
                                +'<div class="gf_top_video_w">'
                                +'<video class="gf_top_video" controls src="'+covers[i].media.url+'"></video>'
                                +'</div>'
                                +'</div>';
                        }

                    }

                    $('#covers').html(coversHtml);
                    //初始化swiper
                    var mySwiper = new Swiper('.swiper_container_gd',{
                        pagination : '.swiper_pagination_gd',
                        paginationType : 'fraction',
                    });
                    //店铺信息
                    var shop_info=result.goods_info.shop_info;

                    //商品基本信息
                    var goodsInfoHtml='<h2>'+goodsInfo.title+'</h2>' +
                        '<p class="des">'+goodsInfo.sub_title+'</p> ' +
                        '<div class="prices"><strong>￥'+goodsInfo.price+'</strong></div> ' +
                        '<a href="shop_new.html?store_id='+shop_info.store_id+'" class="shoplink">'+shop_info.store_name+' ></a>';
                    $('.gd_info').html(goodsInfoHtml);
                    //分享数据
                    shareTitle=encodeURIComponent(goodsInfo.share.share_title);
                    shareLink=goodsInfo.share.share_url;
                    sharePic=goodsInfo.share.share_img;
                    shareContent=goodsInfo.share.share_content;

                }


                var skuList=result.goods_info.sku;
                if(skuList.length==1){
                    is_first=false;
                };
                var goodsTitle='';
                if(skuList){

                    //规格列表
                    var skuHtml='';
                    for(var i in skuList){
                        sku=skuList[i];
                        var classMy='';
                        if(sku.id==gid ){
                            goodsTitle=sku.name;
                            classMy='checked';
                            if(sku.limit!='0'){
                                kucun=sku.limit;
                            }else{
                                kucun=sku.quantity;
                            }
                        }

                        if(sku.quantity<=0){
                            classMy='cantcheck';
                        }
                        skuHtml+='<span class="sku '+classMy+'" n="'+sku.name+'" gid="'+sku.id+'" price="'+sku.price+'" prime="'+sku.orign_price+'">'+sku.name+'</span>';
                    }
                    //以选择的规格，即当前商品
                    var topHtml='<img src="'+goodsInfo.cover_img+'"> ' +
                        '<div class="price"> ' +
                        '<span id="gd_checkprice">￥'+goodsInfo.price+'</span> ' +
                        '<i id="gd_checkprime">￥'+goodsInfo.orign_price+'</i> ' +
                        '<strong style="text-overflow: ellipsis;" id="gd_checkn">已选择：'+goodsTitle+'</strong> ' +
                        '</div>';
                    $("#choose_form").find('.top').html(topHtml);
                    $("#choose_form").find('.info').find("#gd_goods_checkoptions").html(skuHtml);
                }else{

                }
                //商品规格
                if(!is_first){
                    $('#gd_checkbtn').find('strong').html(goodsTitle);
                    $('#gd_checkbtn').find('span').html("×1");
                }
                if(no_change){ //如果是切换规格，则不变化这部分
                    //店铺优惠信息
                    var promotions=result.goods_info.promotions;
                    var promotionsHtml='';
                    if(promotions){
                        var p_num=promotions.length;
                        if(p_num>1){
                            promotionsHtml+='<a href="javascript:void(0)">'+p_num+'个促销<span class="yh_des"><em class="tag">'+promotions[0].tag_name+'</em>'+promotions[0].small_desc+'</span></a>';
                            var plistHtml='';
                            for(var i in promotions){
                                plistHtml+='<a href="coudan.html?store_id='+shop_info.store_id+'&page=1" class="yh_con_item"><span class="yh_des"><em class="tag">'+promotions[i].tag_name+'</em><p>'+promotions[i].small_desc+'</p></span></a>';
                            }
                            $('.yh_con .yh_form').append(plistHtml);
                        }else if(p_num==1){
                            promotionsHtml+='<a href="coudan.html?store_id='+shop_info.store_id+'&page=1">'+p_num+'个促销<span class="yh_des"><em class="tag">'+promotions[0].tag_name+'</em>'+promotions[0].small_desc+'</span></a>';
                            $('#gd_yhcheckbtn').addClass('only');
                            $('.yh_con').hide();
                        }else{
                            $('#gd_yhcheckbtn').remove();
                        }
                        $('#gd_yhcheckbtn').html(promotionsHtml);
                    }else{
                        $('#gd_yhcheckbtn').hide();
                        $('.yh_con').hide();
                    }

                    //商品详情和评价


                    var desc_info=result.goods_info.desc_info;

                    var desc_infoHtml='';
                    if(desc_info){
                        for(var i in desc_info){
                            if(desc_info[i].type=='img'){
                                desc_infoHtml+='<img class="detailimg" src="'+desc_info[i].media.big+'">';
                            }else if(desc_info[i].type=='text'){
                                desc_infoHtml+='<p class="detaildes">'+desc_info[i].content+'</p>';
                            }
                        }
                    }
                    $("#gd_detail").prepend(desc_infoHtml);

                    var rate_list=result.rate_list;
                    var rate_info=result.rate_info;

                    var rate_listHtml='';
                    if(rate_list.length>0){
                        for(var i in rate_list){
                            if(rate_list[i].eval_type==1) {
                                var words = '【好评】'
                            }else{
                                var words='【差评】'
                            }
                            var imgHtml='';
                            if(rate_list[i].imgs.length>0){
                                imgHtml+='<div class="sdimgs"> ';
                                var imgList=rate_list[i].imgs;
                                for(var y in imgList){
                                    imgHtml+='<div class="imgw"><img src="'+imgList[y].small+'"></div>';
                                }
                                imgHtml+='</div>';
                            }
                            var replyHtml='';
                            if(rate_list[i].geval_explain){
                                replyHtml+='<div class="c4"> ' +
                                    '<div class="kefu_re_w"> ' +
                                    '<p>客服回复:'+rate_list[i].geval_explain+'</p> ' +
                                    '</div> ' +
                                    '</div>';
                            }
                            var is_zan='';
                            if(rate_list[i].is_zan==1){
                                is_zan='zanbtned';
                            }
                            rate_listHtml+='<div class="sdlist_item"> ' +
                                '<div class="c1"> ' +
                                '<img src="'+rate_list[i].user_info.avatar+'" class="avatar"> ' +
                                '<span class="username">'+rate_list[i].user_info.user_name+'</span> ' +
                                '</div> ' +
                                '<div class="c2"> ' +
                                '<p class="words"><span class="tag">'+words+'</span> '+rate_list[i].content+'</p> ' +
                                imgHtml +
                                '</div> ' +
                                '<div class="c3"> ' +
                                '<span class="time">'+rate_list[i].create_time+'</span> ' +
                                '<a href="javascript:void(0)" class="zanbtn '+is_zan+'" geval_id="'+rate_list[i].geval_id+'">'+rate_list[i].zan_num+'</a> ' +
                                '</div> ' +
                                replyHtml +
                                '</div>';
                        }

                        rate_listHtml+='<a href="shaidan_list.html?goods_id='+goodsInfo.id+'&type=1" class="gd_detail_sdlist_more">查看更多评价('+rate_info.all+')</a>';
                    }
                    $("#gd_detail_sdlist").html(rate_listHtml);
                    if(rate_listHtml==''){
                        $("#sidebtns span").eq(1).html('');

                    }
                    //console.log(rate_list);
                    //最后一张详情图片
                    var　last_desc_img=goodsInfo.last_desc_img;
                    if(last_desc_img){
                        $("#gd_detail_sdlist").after('<img class="detailimg" src="'+last_desc_img.big+'">');
                    }
                    //相关菜谱推荐
                    var recipe_relate=result.recipe_relate;
                    var recipe_relateHtml='';
                    if(recipe_relate.length>0){
                        $("#gd_cplist").show();
                        for(var i in recipe_relate){
                            var recipe=recipe_relate[i];
                            recipe_relateHtml+='<div class="gd_cplistitem"> ' +
                                '<a href="http://m.meishij.net/html5/news.php?id='+recipe.id+'" name="recipe" news_id="'+recipe.id+'"> ' +
                                '<img src="'+recipe.cover_img_url+'" class="img"> ' +
                                '<strong>'+recipe.title+'</strong> ' +
                                '</a> ' +
                                '</div>';
                        }
                        $("#gd_cplist .gd_cplistw").before('<h4 class="gd_subtitle">相关菜谱</h4>');
                    }
                    if(recipe_relateHtml==''){
                        $("#sidebtns span").eq(2).html('');
                        $("#gd_cplist").css({
                            "height":"0px",
                            "padding":"0px"
                        });
                    }
                    $("#gd_cplist .gd_cplistw").append(recipe_relateHtml);

                    //相关商品
                    var goods_relateHtml='';
                    if(goodsInfo.goods_relate){
                        $('#recgoods').show();
                        var goods_relate=goodsInfo.goods_relate;
                        for(var i in goods_relate){
                            var rgoods=goods_relate[i];
                            var tags='';
                            var k=rgoods.tags.length;
                            if(rgoods.tags.length==1){
                                k=3;
                            }else if(rgoods.tags.length==3){
                                k=1;
                            }
                            for(var a in rgoods.tags){
                                var index=parseInt(a)+parseInt(k);
                                tags+='<span class="tag'+index+'">'+rgoods.tags[a].title+'</span>';
                            }
                            goods_relateHtml+='<div class="mi_goodlistitem mi_goodlistitem_bigimgview"> ' +
                                '<a href="product_detail2.html?goods_id='+rgoods.id+'" name="goods" gid="'+rgoods.id+'" class="mi_goodlistitem_link"> ' +
                                '<div class="imgw"><img src="'+rgoods.cover_img+'"></div> ' +
                                '<strong class="t">'+rgoods.title+'</strong> ' +
                                '<p class="des">'+rgoods.sub_title+'</p> ' +
                                '<div class="tagw"> ' +
                                tags +
                                '</div> ' +
                                '<div class="price">优选价￥<em>'+rgoods.price+'</em></div> ' +
                                '<span class="his_price"><span class="del">原价</span>￥<span class="del">'+rgoods.ori_price+'</span></span> ' +
                                '</a> ' +
                                '</div>';
                        }
                        $('#recgoods .gd_cplistw').before('<h4 class="gd_subtitle">相关推荐</h4>');

                    }

                    $('#recgoods .gd_cplistw').append(goods_relateHtml);
                    //客服

                    $(".gd_bottomw .gdb_kfbtnw").find('a').attr('href','http://m.meishij.net/html5/chat.php?other_user='+goodsInfo.kefu.user_id);

                    //分享
                    var shareHtml='<div class="t">分享至</div> ' +
                        '<div class="c"> ' +
                        '<div class="share_box_items" act="sina"><a href="javascript:void(0);" ><img src="http://static.meishij.net/wap6/images/weibo_1.png"><span>新浪微博</span></a></div> ' +
                        '<div class="share_box_items" act="qq"><a href="javascript:void(0);"><img src="http://static.meishij.net/wap6/images/qzone_1.png"><span>QQ空间</span></a></div> ' +
                        '</div> ' +
                        '<span class="shut" id="share_box_shutbtn">取消</span>';
                    $("#share_box").append(shareHtml);
                }
            }else{
                Alert(result.msg);
                setTimeout(function(){
                    window.history.go(-1);
                }, 2000);

            }
        }

    });
}

