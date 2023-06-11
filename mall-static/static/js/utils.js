// url传值
function getUrlParam(key){
    var url = decodeURI(window.location.toString());
    var arr = url.split("?");
    if(arr.length>1){
        var params = arr[1].split("&");
        for(var i = 0;i < params.length;i++){
            var param = params[i];
            if(param.split("=")[0] == key){
                return param.split("=")[1];
            }
        }
    }
    return null;
}


/**
 * 手机号校验
 1--以1为开头；
 2--第二位可为3,4,5,7,8,中的任意一位；
 3--最后以0-9的9个整数结尾。
 */
 function checkTelephone(telephone) {
    var reg=/^[1][3,4,5,7,8][0-9]{9}$/;
    if (!reg.test(telephone)) {
        return false;
    } else {
        return true;
    }
}