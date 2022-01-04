

function addfile(formname) {
	
	var count = parseInt(formname.mp3count.value);
	
	var getTable = document.getElementById("setTable");
	var html1 = '<table width="380" height="100">';

	var html = "";
	var html2 = '<tr><th bgcolor="silver">앨범이미지:</th><td align="left"><input name="albumimage" type="file" size="22"></input></td></tr><tr><td bgcolor="silver" colspan="2"><center><input type="submit" value="upload" /><input type="button" value="cancel" onclick=""/></center></td></tr>';

	for ( var i = 0; i < count; i++) {
		html += '<tr><th bgcolor="silver">노래제목'
				+ (i + 1)
				+ ':</th><td align="left"><input type="text" name="songname'
				+ i
				+ '"size="22"/></td></tr><tr><th bgcolor="silver">mp3파일'
				+ (i + 1)
				+ ':</th><td align="left"><input type="file" size="22" name="mp3file'
				+ i + '"/></td></tr>';

	}
	getTable.innerHTML = html1 + html + html2;
	getTable.appendChild(makeTable);
}