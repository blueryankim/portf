<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function myinsert() {
  var opts=myform.myselect.options;
  var opt=document.createElement("option");
  opt.innerText=myform.mytext.value;
  opts.insertAdjacentElement("beforeEnd",opt);
}
function myremove() {
  var opts=myform.myselect.options;
  for (var i=0; i<opts.length; i++) {
    if (opts[i].selected) {
      opts[i--].removeNode(true);
    }
  }
}
function myup() {
  var opts=myform.myselect.options;
  for (var i=0; i<opts.length; i++) {
    if (opts[i].selected && i>0) {
      tmp=opts[i].cloneNode(true);
      opts[i].removeNode(true);
      opts[i-1].insertAdjacentElement("beforeBegin",tmp).selected=true;
    }
  }
}
function mydown() {
  var opts=myform.myselect.options;
  for (var i=opts.length-1; i>=0; i--) {
    if (opts[i].selected && i<opts.length-1) {
      tmp=opts[i].cloneNode(true);
      opts[i].removeNode(true);
      opts[i].insertAdjacentElement("afterEnd",tmp).selected=true;
    }
  }
}
</script>
</head>
<body>
<form name=myform>
<table>
  <tr><td bgcolor=gray colspan=3 style="height:1"></td></tr>
  <tr>
    <td colspan=2>
      <select name=myselect size=12 style="width:400px">
      </select>
    </td>
    <td rowspan=2 valign=top>&nbsp;&nbsp;
      <input type=text name=mytext
        onkeydown="if(event.keyCode==13){myinsert();return false;}">&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
  </tr>
  <tr>
    <td>
      <input type=button value="+추가" onclick="myinsert()">
      <input type=button value="-삭제" onclick="myremove()">
    </td>
    <td align=right>
      <input type=button value="▲" onclick="myup()">
      <input type=button value="▼" onclick="mydown()">
    </td>
  </tr>
  <tr><td bgcolor=gray colspan=3 style="height:1"></td></tr>
  <tr>
    <td colspan=3 align=right>
      <input type=submit value="확인">
      <input type=reset value="취소">
    </td>
  </tr>
</table>
</form>
</body>
</html>


