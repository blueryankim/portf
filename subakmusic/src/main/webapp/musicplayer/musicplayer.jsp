<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수박 플레이어</title>
	<link href="../css/style_nobg.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	window.onload = initSongInfor;
	var prevonload = window.onload;
	window.onload = function() {
		prevonload();
		setTimeAndTempImg();
	};
	var songarray = new Array();
	var songinforarray = new Array();

	var index = "";
	var flag=0;

	function initSongInfor() {
		var form = document.playList;
		var takesongnum = form.songnums;
		var takesonginfor = form.songinfor;
		var tempsongs = "";
		var tempsonginfor = "";

		for ( var i = 0; i < takesongnum.length; i++) {
			tempsongs += takesongnum[i].value + ",";
		}

		var tempsongs2 = tempsongs.substring(0, tempsongs.length - 1);
		songarray = tempsongs2.split(",");

		for ( var i = 0; i < takesonginfor.length; i++) {
			tempsonginfor += takesonginfor[i].value + "%";
		}

		var tempsonginfor2 = tempsonginfor.substring(0,
				tempsonginfor.length - 1);
		songinforarray = tempsonginfor2.split("%");
		index = 0;
		//노래 리스트에 대한 모든 정보를 hidden처리된 태그로부터 정보를 얻는다.
	}

	function setTimeAndTempImg() {

		var myAudio = document.getElementById("myAudio");
		var tempImg = document.getElementById("tempoimg");
		myAudio.addEventListener("timeupdate", function() {
			time.innerHTML = "&nbsp;&nbsp;"
					+ parseInt(Math.floor(myAudio.currentTime) / 60) + ":"
					+ parseInt(Math.floor(myAudio.currentTime) % 60) + "/"
					+ parseInt(Math.floor(myAudio.duration) / 60) + ":"
					+ parseInt(Math.floor(myAudio.duration) % 60);
		});

		tempImg.innerHTML = '&nbsp;<img src="../subak_images/sub/player/soundbar.gif">';

	}

	function playandpause() {
		var myAudio = document.getElementById("myAudio");
		var changebutton = document.getElementById("changebutton");
		var tempImg = document.getElementById("tempoimg");
		if (myAudio.paused) {
			
			if(index==songinforarray.length){
				index=0;
				changeInfor(songinforarray[index]);
			}
			myAudio.play();
			changebutton.setAttribute("src", "../subak_images/sub/player/playerpause.png");
			tempImg.innerHTML = '&nbsp;<img src="../subak_images/sub/player/soundbar.gif">';
		} else {
			myAudio.pause();
			changebutton.setAttribute("src", "../subak_images/sub/player/playerplay.png");
			tempImg.innerHTML = '&nbsp;<img src="../subak_images/sub/player/soundbar1.gif">';
			}
	}

	function choosedSong(songinformation1) {

		var songinformation = songinformation1;
		var forindex = songinformation1.split(",");

		index = forindex[0];
		alert(index);
		changeInfor(songinformation);

	}

	function nextsong() {
		var changebutton = document.getElementById("changebutton");

		if (songarray.length == 1) {
			alert("다음 노래가 없습니다.");
			return false;
		}
		if (index == songarray.length - 1) {
			alert("다음 노래가 없습니다.");
			return false;
		}
		index++;
		abstractInfor(index);
		changebutton.setAttribute("src", "../subak_images/sub/player/playerpause.png");
	}

	function presong() {
		var changebutton = document.getElementById("changebutton");
		if (songarray.length == 1) {
			alert("이전 노래가 없습니다.");
			return false;
		}
		if (index == 0) {
			alert("이전 노래가 없습니다.");
			return false;
		}
		index--;
		abstractInfor(index);
		changebutton.setAttribute("src", "../subak_images/sub/player/playerpause.png");
	}

	function abstractInfor(index) {
		var songinfor = songinforarray[index];

		changeInfor(songinfor);//abstractInfor후에 chageInfor!!

	}

	/*"${num.index},${list.songnum},${list.path},${list.songname},${list.singer }" */
	function changeInfor(songinformation1) {

		var songinformation = songinformation1.split(",");
		var albumimage = document.getElementById("albumimage");
		var songnameandsinger = document.getElementById("songnameandsinger");
		var time = document.getElementById("time");
		var myAudio = document.getElementById("myAudio");
		var myAudiopath = "";

		if (songarray.length == 1) {
			myAudiopath = "../mp3files" + songinformation[2] + "/"
					+ songinformation[1] + ".mp3";
			myAudio.addEventListener("ended", function() {
				this.currentTime = 0;
			}, false);
		}
		if (songarray.length != 1) {
			myAudiopath = "../mp3files" + songinformation[2] + "/"
					+ songarray[songinformation[0]] + ".mp3";
		}
		
		//index가 songinforarray 길이와 같을때.
		
		
		myAudio.setAttribute("src", myAudiopath);
		myAudio.setAttribute("type", "audio/mp3");

		var albumimagestr = "../albumimage/" + songinformation[2] + "/"
				+ songinformation[1] + ".jpg";
		albumimage.setAttribute("src", albumimagestr);
		songnameandsinger.innerHTML = songinformation[3] + " | "
				+ songinformation[4];
		myAudio.addEventListener("timeupdate", function() {
			time.innerHTML = "&nbsp;&nbsp;"
					+ parseInt(Math.floor(myAudio.currentTime) / 60) + ":"
					+ parseInt(Math.floor(myAudio.currentTime) % 60) + "/"
					+ parseInt(Math.floor(myAudio.duration) / 60) + ":"
					+ parseInt(Math.floor(myAudio.duration) % 60);
		});

	}

	function autoNextSong() {
		if (songinforarray.length == 1) {
			var songinfor=document.getElementById("songinfor");
			songinforarray[0]=songinfor.value;
			

		}
		
		var changebutton = document.getElementById("changebutton");
		var tempImg = document.getElementById("tempoimg");

		index++;
		
		if (index == songinforarray.length) {
			var myAudio = document.getElementById("myAudio");
			changebutton.setAttribute("src", "../subak_images/sub/player/playerplay.png");
			tempImg.innerHTML = '&nbsp;<img src="../subak_images/sub/player/soundbar1.gif">';
			myAudio.currentTime=0;
			myAudio.pause();
			return;
		
		}
		
		changeInfor(songinforarray[index]);
	}
	
	function openAlbumInfor(){
		
		if(songinforarray.length==1){
		var songinfor1=document.getElementById("songinfor").value;
		var songinfor=songinfor1.split(",");
		}
		else{
		var songinfor=songinforarray[index].split(",");}
		window.open('albuminfor.do?songnum='+songinfor[1]+'','','width=520, height=500,scrollbars=yes, menubar=no');
	}
	</script>
</head>
<body bgcolor="black">
	
	<form name="changemusic">
		<!-- 오디오 만들기 -->
		<audio id="myAudio" autoplay onended="autoNextSong()" src="../mp3files${songinfor.path}/${songinfor.songnum}.mp3">
			<font color="#FFFFFF">Your user agent does not support the HTML5 Audio element.</font>
		</audio>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td></td>
				<td colspan="3" class="subTitle"><font color="#4CE628">Music List</font></td>
				<td></td>
			</tr>
			<tr><td colspan="5" height="5"></td></tr>
			<tr>
				<td width="10"></td>
				<td width="100" rowspan="3"><img id="albumimage" width="100" height="100" src="../albumimage/${songinfor.path}/${songinfor.songnum}.jpg" /></td>
				<td width="10" rowspan="3"></td>
				<td width="*"><font color="#FFFFFF"><marquee id="songnameandsinger" scrollamount="2">${songinfor.songname} - ${songinfor.singer }</marquee></font></td>
				<td width="10"></td>
			</tr>
			<tr>
				<td></td>
				<td>
					<a href="#" onclick="presong()"><img src="../subak_images/sub/player/playerpre.png" border="0" /></a>
					<a href="#" onclick="playandpause()"><img id="changebutton" src="../subak_images/sub/player/playerpause.png" border="0" /></a>
					<a href="#" onclick="nextsong()"><img src="../subak_images/sub/player/playernext.png" border="0" /></a>
				</td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td>
					<font id="time" color="#FFFFFF"></font><span id="tempoimg"></span>
					<a href="#" onclick="openAlbumInfor()"><img src="../subak_images/sub/player/albuminfo.gif" border="0" /></a>
				</td>
				<td></td>
			</tr>
			<tr><td colspan="5" height="5"></td></tr>
		</table>
	</form>
	
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="10"></td>
			<td>
				<table border="0" cellpadding="5" cellspacing="0">
					<tr bgcolor="#42AEE0">
						<td><img src="../subak_images/sub/player/music.png"></td>
						<td><font color="#FFFFFF" style="font-weight:bold;font-size:8pt;">TOTAL (${songcount})</font></td>
					</tr>
				</table>
				<form name="playList">
					<table width="280" height="10" bgcolor="white" style="border-right-style: inset; border-right-width: 5px; border-right-color: white; border-bottom-style: outset; border-bottom-width: 5px; border-bottom-color: white">
						<tr>
							<td>
								<div style="overflow-y:scroll; width:270px; height:160px; padding:5px;">
									<c:forEach var="list" items="${musicPlayerList}" varStatus="num">
										<input type="hidden" id="songnums" value="${list.songnum}" />
										<input type="hidden" id="songinfor" value="${num.index},${list.songnum},${list.path},${list.songname},${list.singer}" />
										<c:set var="songinformation1" value="${num.index},${list.songnum},${list.path},${list.songname},${list.singer }" scope="page" />
										${num.count}. <a href="#" onclick="choosedSong('${songinformation1}')"><b>${list.songname }</b></a><br/>
									</c:forEach>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</td>
			<td width="10"></td>
		</tr>
	</table>


</body>
</html>