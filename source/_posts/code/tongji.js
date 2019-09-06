//获取cookie ar_stat_uv的值
var uv_str = ar_get_cookie("ar_stat_uv");
var uv_id = "";
// 如果cookie ar_stat_uv的值为空
if(uv_str == ""){
	// 为这个新uv配置ID，为一个长度为20的随机数
	uv_id = ar_get_random(20)
	// 设置cookie ar_stat_uv保存时间为10年
	ar_set_cookie("ar_stat_uv",uv_id,1);
}else{
	// 获取uv_id
	uv_id = uv_str

}