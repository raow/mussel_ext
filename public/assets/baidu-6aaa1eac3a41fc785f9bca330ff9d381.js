
  // 百度地图API功能
  function G(id) {
    return document.getElementById(id);
  }

  jQuery(document).ready(function() {  
    initMap();
  });

  function initMap(){
  if ( G("allmap") ) {
  var map = new BMap.Map("allmap");

  var latitude = G("service_vendor_latitude").value || "";
  var longtitude = G("service_vendor_longtitude").value || "";
  var locationdetails = G("service_vendor_location_details").value || "";

  if (latitude  && longtitude ){
    var point = new BMap.Point(longtitude, latitude);
    map.centerAndZoom(point,18);                   // 初始化地图,设置城市和地图级别。 

  }else{
    if (G("service_vendor_province") !== ""){
    map.centerAndZoom(G("service_vendor_province").value,12);                   // 初始化地图,设置城市和地图级别。      

    }else{
    map.centerAndZoom("上海",12);                   // 初始化地图,设置城市和地图级别。          
    }
  }

  if ( locationdetails !== ""){
    map.centerAndZoom(locationdetails,18);                   // 初始化地图,设置城市和地图级别。 
    var local = new BMap.LocalSearch(map, { //智能搜索
      onSearchComplete: function(){
        if (local.getResults() && local.getResults().getPoi(0)){
      var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
      map.centerAndZoom(pp, 18);
      map.addOverlay(new BMap.Marker(pp));    //添加标注
      G("service_vendor_location_details").value = locationdetails;

    }else{
      G("service_vendor_location_details").value = local.getResults().keyword;
    }
      }
    });
    local.search(locationdetails);
  };


  var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
    {"input" : "service_vendor_location_details"
    ,"location" : map
  });

  ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
  var str = "";
    var _value = e.fromitem.value;
    var value = "";
    if (e.fromitem.index > -1) {
      value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
    }    
    str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
    
    value = "";
    if (e.toitem.index > -1) {
      _value = e.toitem.value;
      value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
    }    
    str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
    G("searchResultPanel").innerHTML = str;
  });

  var myValue;
  ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
  var _value = e.item.value;
    myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
    G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
    
    setPlace();
  });

  function setPlace(){
    map.clearOverlays();    //清除地图上所有覆盖物
    function myFun(){
      var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
      map.centerAndZoom(pp, 18);
      map.addOverlay(new BMap.Marker(pp));    //添加标注
      G("service_vendor_latitude").value = pp.lat;
      G("service_vendor_longtitude").value = pp.lng ;
    }
    var local = new BMap.LocalSearch(map, { //智能搜索
      onSearchComplete: myFun
    });
    local.search(myValue);
  }
  
  /*function showInfo(e){
    G("service_vendor_latitude").value = e.point.lat;
    G("service_vendor_longtitude").value = e.point.lng ;
    var selectedPoint = new BMap.Point(e.point.lat,e.point.lng);
    var geoc = new BMap.Geocoder(); 
    
    geoc.getLocation(selectedPoint, function(rs){
      var addComp = rs.addressComponents;
      alert(addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber);
    });   
  }*/

  //map.addEventListener("click", showInfo);
  };

  }
;
