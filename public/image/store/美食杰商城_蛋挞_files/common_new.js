function getQueryString(name){
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");

    var str=window.location.search.substr(1);
    var r = str.match(reg);
    if (r!=null) return r[2]; return '';
}

function addCookie(name,value,expireHours){
    var cookieString=name+"="+escape(value)+"; path=/";
    //判断是否设置过期时间
    if(expireHours>0){
        var date=new Date();
        date.setTime(date.getTime()+expireHours*3600*1000);
        cookieString=cookieString+";expires="+date.toGMTString();
    }
    document.cookie=cookieString;
}

function getCookie(name){
    var strcookie=document.cookie;
    var arrcookie=strcookie.split("; ");
    for(var i=0;i<arrcookie.length;i++){
        var arr=arrcookie[i].split("=");
        if(arr[0]==name)return unescape(arr[1]);
    }
    return null;
}

function delCookie(name){//删除cookie
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval=getCookie(name);
    if(cval!=null) document.cookie= name + "="+cval+"; path=/;expires="+exp.toGMTString();
}

function checkLogin(state){
    if(state == 0){
        location.href = WapSiteUrl+'/tmpl/member/login.html';
        return false;
    }else {
        return true;
    }
}
function contains(arr, str) {
    var i = arr.length;
    while (i--) {
        if (arr[i] === str) {
            return true;
        }
    }
    return false;
}

function Alert(msg){
    $("body").append('<div class="Alert"></div>');
    var msg = msg || '提示信息'
    $(".Alert").html(msg);
    $(".Alert").fadeIn();
    setTimeout(function(){
        $(".Alert").fadeOut();
    }, 3000);
    setTimeout(function(){
        $(".Alert").remove();
    }, 4000);
}

var SiteUrl = "http://"+window.location.host+"/shop";//"http://v5.33hao.com/shop";
var ApiUrl = "http://"+window.location.host+"/mobile";//"http://v5.33hao.com/mobile";
var pagesize = 10;
var WapSiteUrl = "http://"+window.location.host+"/wap";//"http://v5.33hao.com/wap";
var IOSSiteUrl = "http://"+window.location.host+"/app.ipa";//"http://v5.33hao.com/app.ipa";
var AndroidSiteUrl = "http://"+window.location.host+"/app.apk";//"http://v5.33hao.com/app.apk";
(function() {
    var m = /^(https?:\/\/.+)\/wap/i.exec(location.href);
    if (m && m.length > 1) {
        SiteUrl = m[1] + '/shop';
        ApiUrl = m[1] + '/mobile';
        WapSiteUrl = m[1] + '/wap';
    }
})();

console.log(
    '___'+'/\\\\\\\\'+'____________'+'/\\\\\\\\'+'______'+'/\\\\\\\\\\\\\\\\\\\\\\'+'_________'+'/\\\\\\\\\\\\\\\\\\\\\\'+'_'+'\n'+
    '___'+'\\/\\\\\\\\\\\\'+'________'+'/\\\\\\\\\\\\'+'____'+'/\\\\\\/////////\\\\\\'+'______'+'\\/////\\\\\\///'+'__'+'\n'+
    '____'+'\\/\\\\\\//\\\\\\'+'____'+'/\\\\\\//\\\\\\'+'___'+'\\//\\\\\\'+'______'+'\\///'+'___________'+'\\/\\\\\\'+'_____'+'\n'+
    '_____'+'\\/\\\\\\\\///\\\\\\/\\\\\\/'+'_'+'\\/\\\\\\'+'____'+'\\////\\\\\\'+'__________________'+'\\/\\\\\\'+'_____'+'\n'+
    '______'+'\\/\\\\\\'+'__'+'\\///\\\\\\/'+'___'+'\\/\\\\\\'+'_______'+'\\////\\\\\\'+'_______________'+'\\/\\\\\\'+'_____'+'\n'+
    '_______'+'\\/\\\\\\'+'____'+'\\///'+'_____'+'\\/\\\\\\'+'__________'+'\\////\\\\\\'+'____________'+'\\/\\\\\\'+'_____'+'\n'+
    '________'+'\\/\\\\\\'+'_____________'+'\\/\\\\\\'+'___'+'/\\\\\\'+'______'+'\\//\\\\\\'+'____'+'/\\\\\\'+'___'+'\\/\\\\\\'+'_____'+'\n'+
    '_________'+'\\/\\\\\\'+'_____________'+'\\/\\\\\\'+'__'+'\\///\\\\\\\\\\\\\\\\\\\\\\/'+'____'+'\\//\\\\\\\\\\\\\\\\\\'+'______'+'\n'+
    '__________'+'\\///'+'______________'+'\\///'+'_____'+'\\///////////'+'_______'+'\\/////////'+'_______'+'\n');