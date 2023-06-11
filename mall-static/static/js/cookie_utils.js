var operator = "=";

/**
 * 存cookie
 * @param {*} key 
 * @param {*} value 
 */
function setCookieValue(key,value){
	document.cookie = key + operator + value;
}

/**
 * 取cookie
 * @param {*} cname 
 * @returns 
 */
function getCookieValue(cname)
{
  var name = cname + operator;
  var ca = document.cookie.split(';');
  for(var i=0; i<ca.length; i++) 
  {
    var c = ca[i].trim();
    if (c.indexOf(name)==0) return c.substring(name.length,c.length);
  }
  return "";
}
/**
 * 存cookie并设置过期时间
 * @param {*} key 
 * @param {*} value 
 */
function setCookieValue2(key, value) {
  var expires = new Date();
  expires.setTime(expires.getTime() + 3 * 60 * 1000); // 设置过期时间为当前时间加上3m
  var cookieValue = key + operator + value + ";expires=" + expires.toUTCString();
  document.cookie = cookieValue;
}

