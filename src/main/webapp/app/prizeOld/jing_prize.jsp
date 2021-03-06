<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Jing</title>

<style type="text/css">
html,body{height:100%}
html,body,form,input,span,p,img,table,tr,td,tbody,dl,dd,dt,h2,h3,ul,li{margin:0;padding:0;border:0}
body{background:white;font:12px/1.5 arial,sans-serif;text-align:center;font-family:"Microsoft YaHei"}
h2,h3{font-weight:normal}
a{text-decoration:none;cursor:pointer}
a:hover{text-decoration:underline}
body{background:#f7f7f7}


.so-year-playbox{float:left;position:relative}
.so-year-playbox td{text-align:center}
.so-year-playbox-shadow{position:absolute;top:-1px;left:-1px;width:708px;height:506px;display:none}
.so-year-playbox-box{width:100px;height:100px;border:2px #50cc12 solid;position:absolute;top:-1px;left:-1px}
#so-year-start{width:240px;height:77px;display:inline-block;background-image:url(${cy}/app/prize/images/btns.png);background-repeat:no-repeat 0 0;background-position:0 0}
#so-year-start:hover{background-position:0 -78px}
#so-year-start:active{background-position:0 -158px}
#so-year-start em{visibility:hidden}
.so-year-playbox .so-year-i{font-size:18px;color:#bf982b;text-shadow:1px 1px 1px #fef5a8}
.so-year-playbox .so-year-i em{font-style:normal}
.so-year-lucker{width:252px;height:506px;overflow:hidden;float:right;border:1px #f4f4f4 solid;position:relative}
.so-year-lucker ul{width:100%;position:absolute;top:45px;left:0;height:460px;overflow:hidden}
.so-year-lucker li{list-style:none;text-align:left;line-height:22px;font-family:arial;color:#666;margin:10px;padding:0 0 10px 5px;border-bottom:1px #efefef solid}
.so-year-lucker li b{color:#333}
.so-year-lucker li em{color:#27b30a;font-style:normal}

#dialog-layer{position:absolute;top:50px;left:40px;display:none;width:600px;padding:10px 20px;background:#f7f7f7;color:#666}
#dialog-content{clear:both}#dialog-content .good p{font-size:14px;color:#666;text-align:center;text-shadow:none;padding:10px 0}
#dialog-content .good .title{font-size:14px;color:#e53d29;text-align:center;padding:10px 0;text-shadow:0 0 1px #fff}
#dialog-content .good .title em{font-style:normal}
#dialog-content .good label{font-size:16px;color:#666;width:75px;text-align:right;margin-right:5px;display:inline-block}
#dialog-content .good input{width:220px;height:43px;border:1px #b7b7b7 solid;color:#666;text-indent:5px}
#dialog-content .good .line{margin-bottom:14px;padding:0}
#dialog-content .finish{height:222px;color:#666;font-size:14px;text-shadow:none;line-height:40px;margin-top:60px}

.btn_submit{display:inline-block}
.tips{color:#c00;position:relative;top:-15px;left:8px}
#close{float:right;margin:2px -5px 0 5px;cursor:pointer}
</style>

</head>
<body>

<div style="margin:50px auto; width:708px;">
    	<div class="so-year-playbox">
        <table width="706" border="0" cellpadding="0" cellspacing="1">
            <tr>
                <td><img src="images/y_08.png" width="100" height="100" alt=""></td>
                <td><img src="images/y_10.png" width="100" height="100" alt=""></td>
                <td><img src="images/y_12.png" width="100" height="100" alt=""></td>
                <td><img src="images/y_14.png" width="100" height="100" alt=""></td>
                <td><img src="images/t016335d0fa857ed3bb.png" width="100" height="100" alt=""></td>
                <td><img src="images/y_18.png" width="100" height="100" alt=""></td>
                <td><img src="images/y_20.png" width="100" height="100" alt=""></td>
            </tr>
            <tr>
                <td><img src="images/y_33.png" width="100" height="100" alt=""></td>
                <td rowspan="3" colspan="5" background="images/y_34.png" width="504" height="302">
                	<a href="javascript:;" id="so-year-start"><em>立即抽奖</em></a>
                    <p class="so-year-i">今日剩余抽奖机会：<em id="so-year-times">2</em>次</p>
                </td>
                <td><img src="images/y_35.png" width="100" height="100" alt=""></td>
            </tr>
            <tr>
                <td><img src="images/y_38.png" width="100" height="100" alt=""></td>
                <td><img src="images/y_39.png" width="100" height="100" alt=""></td>
            </tr>
            <tr>
                <td><img src="images/t01fb45eb81a6d067f3.png" width="100" height="100" alt=""></td>
                <td><img src="images/t0161946d5ee6a53c94.png" width="100" height="100" alt=""></td>
            </tr>
            <tr>
                <td><img src="images/y_47.png" width="100" height="100" alt=""></td>
                <td><img src="images/t014907a7bd8570980f.png" width="100" height="100" alt=""></td>
                <td><img src="images/y_50.png" width="100" height="100" alt=""></td>
                <td><img src="images/y_52.png" width="100" height="100" alt=""></td>
                <td><img src="images/y_54.png" width="100" height="100" alt=""></td>
                <td><img src="images/y_56.png" width="100" height="100" alt=""></td>
                <td><img src="images/y_57.png" width="100" height="100" alt=""></td>
            </tr>
        </table>
        <div id="rbox" class="so-year-playbox-box"></div>
        <div id="dialog-layer">
        	<span id="close"><img src="images/t01407e3942efd1a3f7.png"></span>
            <div id="dialog-content"></div>
        </div>
        </div>
  </div>
  
<script type="text/javascript" src="js/jquery.1.8.3-min.js"></script>
<script type="text/javascript">
	var cy = false;
(function() {
    var e = {
        config: {
            selector: $("#so-year-start"),
            timer: $("#so-year-times"),
            box: $("#rbox"),
            indexs: [0, 1, 2, 3, 4, 5, 6, 13, 20, 27, 34, 33, 32, 31, 30, 29, 28, 21, 14, 7],
            gifts: {
                nothing: [0, 6],
                car: [31],
                surface: [2],
                yunpan: [1, 3, 5, 14, 20, 28, 30, 32, 34],
                u: [21],
                phone: [33],
                jipiao: [27],
                ecard: [4],
                scard: [7],
                jd: [29],
                lihe: [13]
            },
            level: ["car", "surface", "ecard", "scard", "jipiao", "phone", "jd", "lihe", "u", "yunpan"],
            loop: 2,
            code: "0639c5",
            mid: 0
        },
        runtime: {
            index: 0,
            cell: 0,
            state: "",
            times: 2
        },
        start: function() {
            function i() {
                var t = setTimeout(function() {
                    var t = e.getPosition(),
                    r = e.config.loop > 0 ? 50 : 180 + n * 25;
                    e.runtime.isMove = !0,
                    e.config.box.animate({
                        top: t.top + "px",
                        left: t.left + "px"
                    },
                    r, "swing",
                    function() {
                        e.runtime.isMove = !1,
                        n > 15 && e.config.loop--,
                        n > e.config.indexs.length && (n = 0),
                        n++,
                        e.isGoOn() ? i() : (e.runtime.lock = !1, !e.runtime.isMove && !e.runtime.lock && $("#dialog-layer").show())
                    })
                },
                80)
            }
            var e = this,
            t = e.config.indexs,
            n = 0,
            r = !1;
            e.config.loop = 2,
            e.runtime.lock || e.getAward(function() {
                e.runtime.lock = !0,
                e.runtime.state != "notimes" && i()
            })
        },
        isGoOn: function() {
            var e = this,
            t = e.config.indexs,
            n = e.runtime.index,
            r = e.runtime.gap;
            return e.config.loop > 0 ? !0 : e.config.loop <= 0 && t[n] != r ? !0 : !1
        },
        next: function() {
            var e = this,
            t = e.config.indexs;
            return e.runtime.index++,
            e.runtime.index > t.length - 1 && (e.runtime.index = 0),
            e.config.loop <= 0 && (e.config.loop = 0),
            t[e.runtime.index]
        },
        getCell: function() {
            var e = this,
            t = e.next(),
            n = Math.floor(t / 7);
            return {
                row: n,
                col: t - 7 * n
            }
        },
        getPosition: function() {
            var e = this,
            t = e.getCell();
            return {
                top: t.row * 100 + (t.row - 1),
                left: t.col * 100 + (t.col - 1)
            }
        },
        getAward: function(e) {
            var t = this;
            t.checkTimes() ? $.ajax({
                url: "http://sehd.360.cn/turntable/thunder/draw",
                data: {
                    active: t.config.code,
                    mid: t.config.mid
                },
                dataType: "jsonp",
                jsonp: "jscallback",
                success: function(n) {
                    t.showResult(n),
                    e()
                }
            }) : (t.showResult({
                status: "error",
                data: "notimes"
            }), $("#dialog-layer").show())
        },
        showResult: function(e) {
            var t = this;
            if (e["status"] == "error") switch (e.data) {
            case "argserror":
                t.runtime.state = "argserror",
                t.runtime.gap = 0,
                t.runtime.times--;
                  if(cy){
                		$("#dialog-content").html('<p style="padding:100px 0;">恭喜你,又是cy,看来cy是跑不了了</p>');
                	}
                else{
               	 	$("#dialog-content").html('<p style="padding:100px 0;">恭喜你,获得cy一个</p>');
               	 	cy = true ;
              	}
               	
                break;
            case "nostart":
                t.runtime.state = "nostart",
                t.runtime.gap = 0,
                $("#dialog-content").html('<p style="padding:150px 0;">2</p>');
                break;
            case "end":
                t.runtime.state = "end",
                t.runtime.gap = 0,
                $("#dialog-content").html('<p style="padding:150px 0;">3</p>');
                break;
            case "notimes":
                t.runtime.state = "notimes",
                t.runtime.gap = 0,
                t.isShare() ? $("#dialog-content").html('<p style="padding:150px 0;font-size:18px;">很遗憾,您没有次数了,注定是cy了,没办法啊</p>') : ($("#dialog-content").html(['<p style="font-size:14px;padding:80px 0 30px 0;line-height:24px;">很遗憾,您没有次数了,注定是cy了,没办法啊<br/>', "", "</p>", '<div id="clones" style="padding:20px 0 145px 0;"></div>'].join("")), $("#clones .share").length <= 0 && $("#clones").append($(".share")));
                break;
            case "nodraw":
                t.runtime.state = "nodraw",
                t.runtime.times--,
                t.runtime.gap = t.setGap(e),
                t.runtime.times > 0 ? $("#dialog-content").html('<p style="padding:150px 0;font-size:18px;">很遗憾,您没有次数了,注定是cy了,没办法啊</p>') : $("#dialog-content").html('<p style="padding:150px 0;font-size:18px;">很遗憾,您没有次数了,注定是cy了,没办法啊</p>')
            }
            e["status"] == "ok" && (t.runtime.state = "draw", t.runtime.times--, t.runtime.gap = t.setGap(e), e.data.drawtype < 9 ? $("#dialog-content").html(['<div class="good">', '<p class="title">\u606d\u559c\u60a8\u83b7\u5f97\u4e86\u201c<em>', e.data.drawdesc, "</em>\u201d</p>", "<p>\u8bf7\u60a8\u5728\u4e00\u5c0f\u65f6\u5185\u586b\u5199\u5b8c\u6210\u60a8\u7684\u4e2a\u4eba\u4fe1\u606f\uff0c\u5e76\u8ba4\u771f\u786e\u8ba4\uff0c\u5982\u7531\u4e8e\u4fe1\u606f\u9519\u8bef\u5bfc\u81f4\u65e0\u6cd5\u53d1\u5956\uff0c\u672c\u516c\u53f8\u6982\u4e0d\u8d1f\u8d23</p>", '<form class="award_form">', '<p class="line">', '<label for="name">\u59d3\u540d</label>', '<input type="text" name="name" size="20" />', "</p>", '<p class="line">', '<label for="name">\u624b\u673a\u53f7\u7801</label>', '<input type="text" size="20" name="mobile" />', "</p>", '<p class="line">', '<label for="name">\u6536\u8d27\u5730\u5740</label>', '<input type="text" name="addr" size="46" />', "</p>", '<p class="action">', '<a class="btn_submit" href="javascript:;">', '<img src="images/t01d291f7f4d95515ad.png">', "</a>", '<span class="tips"></span>', "</p></form></div>"].join("")) : $("#dialog-content").html('<p style="padding:150px 0;font-size:18px;">\u606d\u559c\u4f60\u83b7\u5f9736G\u4e91\u76d8\u7a7a\u95f4\u5956<span style="font-size:12px;">\uff08 \u6bcf\u4e2a\u7528\u6237\u6d3b\u52a8\u671f\u95f4\u53ea\u80fd\u6709\u4e00\u6b21\u589e\u52a036G\u4e91\u76d8\u7a7a\u95f4\u7684\u673a\u4f1a\uff09</span><br/><a style="margin-top:5px;" href="http://huodong.yunpan.360.cn/index/so" target="_blank"><img src="p4.qhimg.com/t016264932eedaaf358.png"></a></p>')),
            t.setTimes(),
            t.bindForm()
        },
        checkForm: function(e) {
            var t = e.find("[name=name]"),
            n = e.find("[name=mobile]"),
            r = e.find("[name=addr]"),
            i = e.find("span.tips");
            return ! t.val() || t.hasClass("ph") ? (i.text("\u8bf7\u586b\u5199\u59d3\u540d"), !1) : !n.val() || n.hasClass("ph") ? (i.text("\u8bf7\u586b\u5199\u624b\u673a\u53f7"), !1) : r.size() && !r.val() ? (i.text("\u8bf7\u586b\u5199\u8054\u7cfb\u5730\u5740"), !1) : /^\s+$/.test(t.val()) ? (i.text("\u8bf7\u586b\u5199\u6b63\u786e\u7684\u59d3\u540d"), !1) : /1[3458]\d{9}/.test(n.val()) ? /^\s+$/.test(r.val()) ? (i.text("\u8bf7\u586b\u5199\u6b63\u786e\u7684\u8054\u7cfb\u5730\u5740"), !1) : !0 : (i.text("\u8bf7\u586b\u5199\u6b63\u786e\u768411\u4f4d\u624b\u673a\u53f7"), !1)
        },
        bindForm: function() {
            var e = this;
            $(".btn_submit").click(function(t) {
                if (e.checkForm($("#dialog-content form"))) {
                    var n = $(this),
                    r = $("#dialog-content");
                    n.attr("disabled", "disabled").css("opacity", "0.5"),
                    n.find(".tips").html("");
                    var i = r.find("[name=addr]");
                    $.ajax({
                        url: "http://sehd.360.cn/turntable/thunder/useraddress",
                        dataType: "jsonp",
                        jsonp: "jscallback",
                        data: {
                            active: e.config.code,
                            mid: e.config.mid,
                            phone: r.find("[name=mobile]").val(),
                            address: i.size() ? i.val() : "Virtual Award",
                            accepter: r.find("[name=name]").val(),
                            sendtime: 1
                        },
                        success: function(e) {
                            e.data == "success" ? r.html('<p class="finish">\u611f\u8c22\u60a8\u7684\u53c2\u4e0e\uff0c\u5df2\u7ecf\u5c06\u60a8\u7684\u4fe1\u606f\u8bb0\u5f55\uff0c\u6211\u4eec\u4f1a\u5728\u6d3b\u52a8\u7ed3\u675f\u540e30\u5929\u5185\u53d1\u653e\u5956\u54c1<br/>\u5982\u6709\u4efb\u4f55\u7591\u95ee\uff0c\u8bf7\u9605\u8bfb<a href="http://www.so.com/holiday/816.html#rule" target="_self">\u6d3b\u52a8\u89e3\u91ca</a></p>').find(".close").one("click", hideAward) : (r.find("span.tips").text("\u63d0\u4ea4\u5931\u8d25\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5"), n.removeAttr("disabled").css("opacity", "1"))
                        }
                    })
                }
            })
        },
        isShare: function() {
            var e = this;
            return e._cookie.get("_oys") == 1 ? !0 : !1
        },
        setTimes: function() {
            var e = this,
            t = new Date;
            e.runtime.time <= 0 && (e.runtime.times = 0),
            t.setDate(t.getDate() + 1),
            t.setHours(0, 0, 0, 0),
            e._cookie.set("_oyt", e.runtime.times, t.getTime() - (new Date).getTime()),
            e.setTimeStyle()
        },
        checkTimes: function() {
            var e = this,
            t = e._cookie.get("_oyt");
            return t && t <= 0 ? !1 : !0
        },
        setTimeStyle: function() {
            var e = this,
            t = e.config.timer,
            n = e._cookie.get("_oyt");
            t.html(n ? n: e.runtime.times)
        },
        addTimes: function() {
            var e = this,
            t = new Date;
            t.setDate(t.getDate() + 1),
            t.setHours(0, 0, 0, 0),
            e._cookie.get("_oys") || e._cookie.set("_oys", 1, t.getTime() - (new Date).getTime()),
            $.ajax({
                url: "http://sehd.360.cn/turntable/thunder/dealtimes",
                dataType: "jsonp",
                jsonp: "jscallback",
                data: {
                    active: e.config.code,
                    type: 1,
                    mid: e.config.mid
                },
                success: function(t) {
                    t["status"] == "ok" && (e.runtime.times = parseInt(t.data), e.setTimes())
                }
            })
        },
        setGap: function(e) {
            var t = this,
            n = t.config.gifts,
            r = null,
            i = "",
            s = 0;
            return e["data"] == "nodraw" && (r = t.config.gifts.nothing),
            e["status"] == "ok" && (i = t.config.level[e.data.drawtype], r = t.config.gifts[i] || t.config.gifts.nothing),
            s = Math.floor(Math.random() * r.length),
            r[s]
        },
        listen: function() {
            var e = this,
            t = 0;
            e.config.selector.bind("click",
            function() {
                t = e._cookie.get("_oyn"),
               e.start();
            }),
            $("#dialog-content .share a").live("click",
            function() {
                e.isShare() || e.addTimes()
            }),
            $("#close").bind("click",
            function() {
                $("#dialog-layer").find('[name="mobile"]').length > 0 && window.confirm("\u4f60\u5c1a\u672a\u586b\u5199\u4e2d\u5956\u4fe1\u606f\uff0c\u786e\u5b9a\u8981\u5173\u95ed\u5b83\u5417\uff1f") ? ($("#dialog-content").html(""), $("#dialog-layer").hide()) : $("#dialog-layer").hide(),
                $("#clones .share").length > 0 && $(".so-year-share").append($(".share"))
            })
        },
        luckers: function() {
            var e = this;
            $.ajax({
                url: "http://sehd.360.cn/turntable/thunder/drawlist",
                dataType: "jsonp",
                jsonp: "jscallback",
                data: {
                    active: e.config.code,
                    type: 1,
                    mid: Math.random()
                },
                success: function(e) {
                    if (e.status == "ok") {
                        var t = [],
                        n = ["\u5317\u4eac", "\u4e0a\u6d77", "\u6df1\u5733", "\u5e7f\u5dde", "\u6e56\u5317", "\u6cb3\u5317", "\u5c71\u4e1c", "\u65b0\u7586", "\u897f\u85cf", "\u798f\u5efa", "\u6e56\u5357", "\u5c71\u897f", "\u6c5f\u897f", "\u8fbd\u5b81", "\u91cd\u5e86"],
                        r = "";
                        for (var i = 0,
                        s = e.data.length; i < s; i++) r = n[Math.floor(Math.random() * n.length)],
                        e.data[i].drawtype && t.push(["<li>", e.data[i].drawtime, "<br/>\u83b7\u5956\u7528\u6237\uff1a<b>", e.data[i].phone == "" ? r + "\u7f51\u53cb": e.data[i].phone, "</b><br/>\u83b7\u5f97\u5956\u54c1\uff1a<em>", e.data[i].drawdesc, "</em></li>"].join(""));
                        if (t.length) {
                            var o = $(".so-year-lucker ul");
                            o.html(t.join(""));
                            var u = 0;
                            setInterval(function() {
                                u += .1,
                                u >= o[0].scrollHeight - 60 && (u = 0),
                                o.scrollTop(u)
                            },
                            10)
                        }
                    }
                }
            })
        },
        _cookie: {
            get: function(e) {
                var t = document.cookie.match("(^|;) ?" + e + "=([^;]*)(;|$)");
                return t ? unescape(t[2]) : null
            },
            set: function(e, t, n) {
                var r = new Date;
                n ? r.setTime(r.getTime() + n) : r.setFullYear(r.getFullYear() + 1),
                document.cookie = e + "=" + t + ";expires=" + r.toGMTString() + ";path=/"
            }
        },
        setMid: function() {
            var e = this,
            t = e._cookie.get("QiHooGUID"),
            n = 0,
            r = new Date;
            e._cookie.get("_oyu") || t && (n = t.split(".")[0], tmp = n.slice(27, 32), n = n.replace(tmp, (Math.random() + "").slice(3, 8)), r.setDate(r.getDate() + 1), r.setHours(0, 0, 0, 0), e._cookie.set("_oyu", n, r.getTime() - (new Date).getTime())),
            e.config.mid = e._cookie.get("_oyu")
        },
        initTimes: function() {
            var e = this;
            $.ajax({
                url: "http://sehd.360.cn/turntable/thunder/getcurtimes",
                data: {
                    active: e.config.code,
                    mid: e.config.mid
                },
                dataType: "jsonp",
                jsonp: "jscallback",
                success: function(t) {
                    t.status == "ok" && (e.runtime.times = parseInt(t.data), e.setTimes())
                }
            })
        },
        init: function() {
            this.setMid(),
            this.initTimes(),
            this.listen(),
            this.luckers()
        }
    };
    e.init()
})()
</script>

</body>
</html>