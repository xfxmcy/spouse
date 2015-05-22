<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" />
<%-- <jsp:include page="/xfxmcy/initialEasyUI.jsp"></jsp:include> --%>  

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>my photo</title>
<link href="${cy}/js/waterfall/css/lanrenzhijia.css" type="text/css" rel="stylesheet" />

<!-- css -->
<link rel="stylesheet" href="${cy}/js/jquery-easyui-cy/themes/icon.css"/>

<script src="${cy}/js/waterfall/js/jquery.min.js"></script>
<script type="text/javascript" src="${cy}/js/jquery-easyui-cy/easyloader.js"></script>
<script type="text/javascript" src="${cy}/js/fullcalendar/jquery.fancybox-1.3.1.pack.js"></script>
<link rel="stylesheet" href="${cy}/js/fullcalendar/fancybox.css"/>
<script>

var total = 0; 
var pageCurrent = 0;
var initLoad = true ;
var currentPid = "";
var currentTitle = "";
(function($){
   var 
   //参数
   setting={
      column_width:240,//列宽
	  column_className:'waterfall_column',//列的类名
	  column_space:10,//列间距
	  cell_selector:'.cell',//要排列的砖块的选择器，context为整个外部容器
	  img_selector:'img',//要加载的图片的选择器
	  auto_imgHeight:true,//是否需要自动计算图片的高度
	  fadein:true,//是否渐显载入
	  fadein_speed:600,//渐显速率，单位毫秒
	  insert_type:1, //单元格插入方式，1为插入最短那列，2为按序轮流插入
	  getResource:function(index){ 
		 
	  }  //获取动态资源函数,必须返回一个砖块元素集合,传入参数为加载的次数
   },
   //
   waterfall=$.waterfall={},//对外信息对象
   $waterfall=null;//容器
   waterfall.load_index=0, //加载次数
   $.fn.extend({
       waterfall:function(opt){
		  opt=opt||{};  
	      setting=$.extend(setting,opt);
		  $waterfall=waterfall.$waterfall=$(this);
		  waterfall.$columns=creatColumn();
		  render($(this).find(setting.cell_selector).detach(),false); //重排已存在元素时强制不渐显
		  waterfall._scrollTimer2=null;
		  $(window).bind('scroll',function(){
		     clearTimeout(waterfall._scrollTimer2);
			 waterfall._scrollTimer2=setTimeout(onScroll,300);
		  });
		  waterfall._scrollTimer3=null;
		  $(window).bind('resize',function(){
		     clearTimeout(waterfall._scrollTimer3);
			 waterfall._scrollTimer3=setTimeout(onResize,300);
		  });
	   }
   });
   function creatColumn(){//创建列
      waterfall.column_num=calculateColumns();//列数
	  //循环创建列
	  var html='';
	  for(var i=0;i<waterfall.column_num;i++){
	     html+='<div class="'+setting.column_className+'" style="width:'+setting.column_width+'px; display:inline-block; *display:inline;zoom:1; margin-left:'+setting.column_space/2+'px;margin-right:'+setting.column_space/2+'px; vertical-align:top; overflow:hidden"></div>';
	  }
	  $waterfall.prepend(html);//插入列
	  return $('.'+setting.column_className,$waterfall);//列集合
   }
   function calculateColumns(){//计算需要的列数
      var num=Math.floor(($waterfall.innerWidth())/(setting.column_width+setting.column_space));
	  if(num<1){ num=1; } //保证至少有一列
	  return num;
   }
   function render(elements,fadein){
	   var waterStr = "";
	   if(!initLoad && pageCurrent >= (total/8)) return;
	   $.post("${cy}/photo/queryMyPhoto.do?",{"queryType":"queryOnBG","rows":"8","page":(pageCurrent+1)},function(data){
			total = data.total;
			initLoad = false ;
			pageCurrent++ ;
			rows = data.rows;
			if(rows.length  <= 0)
				return ;
			for(var i = 0 ; i <rows.length ; i++){
				/* var oReq = new ActiveXObject("Microsoft.xmlHTTP")
				oReq.open("Get","${cy}/resource/upload"+rows[i].url,false);
				oReq.send();
				//alert(oReq.status)
				if(oReq.status==404)
				alert('不存在');
				else
				alert("存在") */
				//alert(object.FileExists("${cy}/resource/upload"+rows[i].url)); 
				if(rows[i].url){
					//waterStr +=  "<div class=\"cell\"><a href=\"#\"><img src=\"${cy}/resource/upload"+rows[i].url+"\" onerror=\"javascript:this.src='${cy}/resource/upload/main/lin.jpg';\" /></a><p><a href=\"http://www.xfxmcy.com/\">xfxmcy</a></p></div>";
					waterStr +=  "<div class=\"cell\"><a href=\"#\" oncontextmenu=\"updatePhotInfo(\'"+rows[i].id+"\',\'"+rows[i].title+"\')\"><img src=\"${cy}/resource/upload"+rows[i].url+"\" onerror=\"javascript:this.src='${cy}/resource/upload/main/lin.jpg';\" /></a><p>"+rows[i].title+"</p></div>";
				}else
					waterStr +=  "<div class=\"cell\"><a href=\"#\"><img src=\"${cy}/resource/upload/main/lin.jpg\"  /></a><p><a href=\"http://www.xfxmcy.com/\">xfxmcy</a></p></div>";
			}
			renderCy($(waterStr),true); 
		});	
   }
   
   function renderCy(elements,fadein){//渲染元素
      if(!$(elements).length) return;//没有元素
      var $columns = waterfall.$columns;
      $(elements).each(function(i){										
		  if(!setting.auto_imgHeight||setting.insert_type==2){//如果给出了图片高度，或者是按顺序插入，则不必等图片加载完就能计算列的高度了
		     if(setting.insert_type==1){ 
			    insert($(elements).eq(i),setting.fadein&&fadein);//插入元素
			 }else if(setting.insert_type==2){
			    insert2($(elements).eq(i),i,setting.fadein&&fadein);//插入元素	 
		     }
			 return true;//continue
		  }						
		  if($(this)[0].nodeName.toLowerCase()=='img'||$(this).find(setting.img_selector).length>0){//本身是图片或含有图片
		      var image=new Image;
			  var src=$(this)[0].nodeName.toLowerCase()=='img'?$(this).attr('src'):$(this).find(setting.img_selector).attr('src');
			  image.onload=function(){//图片加载后才能自动计算出尺寸
			      image.onreadystatechange=null;
				  if(setting.insert_type==1){ 
				     insert($(elements).eq(i),setting.fadein&&fadein);//插入元素
				  }else if(setting.insert_type==2){
					 insert2($(elements).eq(i),i,setting.fadein&&fadein);//插入元素	 
				  }
				  image=null;
			  }
			  image.onreadystatechange=function(){//处理IE等浏览器的缓存问题：图片缓存后不会再触发onload事件
			      if(image.readyState == "complete"){
					 image.onload=null;
					 if(setting.insert_type==1){ 
					    insert($(elements).eq(i),setting.fadein&&fadein);//插入元素
					 }else if(setting.insert_type==2){
					    insert2($(elements).eq(i),i,setting.fadein&&fadein);//插入元素	 
					 }
					 image=null;
				  }
			  }
			  image.src=src;
		  }else{//不用考虑图片加载
		      if(setting.insert_type==1){ 
				 insert($(elements).eq(i),setting.fadein&&fadein);//插入元素
			  }else if(setting.insert_type==2){
				 insert2($(elements).eq(i),i,setting.fadein&&fadein);//插入元素	 
			  }
		  }						
	  });
   }
   function public_render(elems){//ajax得到元素的渲染接口
   	 
   }
   function insert($element,fadein){//把元素插入最短列
      if(fadein){//渐显
	     $element.css('opacity',0).appendTo(waterfall.$columns.eq(calculateLowest())).fadeTo(setting.fadein_speed,1);
	  }else{//不渐显
         $element.appendTo(waterfall.$columns.eq(calculateLowest()));
	  }
   }
   function insert2($element,i,fadein){//按序轮流插入元素
      if(fadein){//渐显
	     $element.css('opacity',0).appendTo(waterfall.$columns.eq(i%waterfall.column_num)).fadeTo(setting.fadein_speed,1);
	  }else{//不渐显
         $element.appendTo(waterfall.$columns.eq(i%waterfall.column_num));
	  }
   }
   function calculateLowest(){//计算最短的那列的索引
      var min=waterfall.$columns.eq(0).outerHeight(),min_key=0;
	  waterfall.$columns.each(function(i){						   
		 if($(this).outerHeight()<min){
		    min=$(this).outerHeight();
			min_key=i;
		 }							   
	  });
	  return min_key;
   }
   function getElements(){//获取资源
      $.waterfall.load_index++;
      return setting.getResource($.waterfall.load_index,public_render);
   }
   waterfall._scrollTimer=null;//延迟滚动加载计时器
   function onScroll(){//滚动加载
      clearTimeout(waterfall._scrollTimer);
	  waterfall._scrollTimer=setTimeout(function(){
	      var $lowest_column=waterfall.$columns.eq(calculateLowest());//最短列
		  var bottom=$lowest_column.offset().top+$lowest_column.outerHeight();//最短列底部距离浏览器窗口顶部的距离
		  var scrollTop=document.documentElement.scrollTop||document.body.scrollTop||0;//滚动条距离
		  //var windowHeight=document.documentElement.clientHeight||document.body.clientHeight||0;//窗口高度
		  var windowHeight=document.body.clientHeight||document.documentElement.clientHeight||0;//窗口高度
		  if(scrollTop>=bottom-windowHeight){
			 render(getElements(),true);
		  }
	  },100);
   }
   function onResize(){//窗口缩放时重新排列
      if(calculateColumns()==waterfall.column_num) return; //列数未改变，不需要重排
      var $cells=waterfall.$waterfall.find(setting.cell_selector);
	  waterfall.$columns.remove();
	  waterfall.$columns=creatColumn();
      render($cells,false); //重排已有元素时强制不渐显
   }
   
   
   easyloader.load(["dialog", "parser", "tabs","validatebox", "combobox",  "menu" ], function() {
			
	   $('#taskMenu').menu();    
   });
	 
})(jQuery);
/*图片上传*/
function uploadMyPhoto(){
	 parent.$.fancybox({//调用fancybox弹出层 
         'href':'${cy}/js/multifile/index.jsp',
         /* 'transitionIn'  :   'elastic',
         'transitionOut' :   'elastic',
         'speedIn'       :   600, 
         'speedOut'      :   200  */
         'width':'60%',
		 'height':'60%',
		 'autoScale':false,
		 'transitionIn':'none',
		 'transitionOut':'none',
		 'type':'iframe',
		 'enableEscapeButton':true,
		 'onClosed' : function(){
			 location.reload();
		 },//回调函数，关闭fancybox后触发
		 'onStart':function(){}, //回调函数，加载内容是触发
		 'onCancel':function(){},//回调函数，取消加载内容后触发
		 'onComplete':function(){},//回调函数，加载内容完成后触发
		 'onCleanup':function(){}//回调函数，关闭fancybox前触发
         //'overlayShow'   :   false
     }); 
}
/*更新图片信息*/
function updatePhotInfo(id , title){
	currentPid = id;
	currentTitle = title;
	event.preventDefault();
	
	$('#taskMenu').show();
	$('#taskMenu').menu('show', {
		left : event.pageX,
		top : event.pageY
	});
}
/**
 *  EDIT title
 */
var mainDialog,formDia;
function editTitlePhoto(){
	mainDialog = parent.cy.dialog({
		title : 'edit title',
		href : '${cy}/xfxmcy/family/photo/photoForm.jsp',
		width : 620,
		height : 180,
		buttons : [{
			text : 'submit',
			handler : function() {			
				formDia = mainDialog.find('form');
				if(!formDia.form("validate")){
					parent.simpleMessAlert.call(this,'提示',"请认真填写信息");
					return;
				}
				$.post('${cy}/preface/prefacePersistent.do',cy.serializeObject(formDia),function(json){
					if (json.success) {
						$("#prefaceGrid").datagrid("insertRow",{
							index : 0 ,
							row : json.result
						});
						mainDialog.dialog('close');
					}
					parent.simpleMessAlert.call(this,'提示',json.message);
				},'json');
				
			} 
		}, {
			text : 'cancel',
			handler : function() {
				mainDialog.dialog('close');
			}
		}],
		onLoad : function(){
			formDia = mainDialog.find('form');
			parent.$('#previousTitle').html(currentTitle);
			
		}
		
	});
}
/**
 *   go to   top
 */
function topTitlePhoto(){
	
	
}
/**
 * remove
 */
function removeTitlePhoto(){
	
}
</script>
<div style="margin-left: 40%;margin-top: 5%;margin-bottom: 3%">	
		<a onclick="uploadMyPhoto()" style="cursor: pointer;font-size: 14px;">上传图片</a>
</div>
<div id="taskMenu" style="width: 120px;display: none;">
		<div onclick="topTitlePhoto()" data-options="iconCls:'icon-add'">置顶</div>
		<div class="menu-sep"></div>
		<div onclick="editTitlePhoto()" data-options="iconCls:'icon-edit'">修改title</div>
		<div class="menu-sep"></div>
		<div onclick="removeTitlePhoto()"
			data-options="iconCls:'icon-remove'">删除</div>
		<div class="menu-sep"></div>
		
</div>
<div id="waterfall">
</div>
<script>

var opt={
  getResource:function(index,render){//index为已加载次数,render为渲染接口函数,接受一个dom集合或jquery对象作为参数。通过ajax等异步方法得到的数据可以传入该接口进行渲染，如 render(elem)
      
  
  	//	return render.call(this);
  	 /*  
	  if(index>=7) index=index%7+1;
	  var html='';
	  for(var i=20*(index-1);i<20*(index-1)+20;i++){
		 var k='';
		 for(var ii=0;ii<3-i.toString().length;ii++){
	        k+='0';
		 }
		 k+=i;
	     var src="http://cued.xunlei.com/demos/publ/img/P_"+k+".jpg";
		 html+='<div class="cell"><a href="#"><img src="'+src+'" /></a><p>'+k+'</p></div>';
	  }
	  //return "";
	  return $(html); */
  },
  auto_imgHeight:true,
  insert_type:1
};



(function(){
	var rows = null ;
	var waterStr = "";
	$('#waterfall').waterfall(opt);
	/* $.post("${cy}/photo/queryMyPhoto.do?",{"queryType":"queryOnBG","rows":"6","page":"1"},function(data){
		total = data.total;
		rows = data.rows;
		if(rows.length  <= 0)
			return ;
		for(var i = 0 ; i <rows.length ; i++){
			waterStr +=  "<div class=\"cell\"><a href=\"#\"><img src=\"${cy}/js/waterfall/images/00.jpg\" /></a><p><a href=\"http://www.lanrenzhijia.com/\">xfxmcy</a></p></div>";
			
		}
		$("#waterfall").append(waterStr);
		$('#waterfall').append('<p id="pLoading" style="line-height:20px;display:none">正在加载....</p>').waterfall(opt);
	}); */
	
})();



</script>
