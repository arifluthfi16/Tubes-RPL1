<?php 
/** 
session_start();
if (!isset($_SESSION["id_admin"]))
	header("Location: index.php?error=4");
*/
include_once("functions.php");
?>
<!DOCTYPE html>
<html>
<head>
<title>Tambah Req Bahan Baku</title>

<script type="text/javascript" language="javascript"> 
	function validasidata() {
		

		//validasi jumlah belanja bahan baku harus diisi
		var jumlah=document.frm.jumlah.value.trim(); 
		if(jumlah.length==0)
			{ 
				alert("Jumlah Req Bahan Baku Tidak Boleh Kosong."); 
				document.frm.jumlah.focus(); 
				return false; 
			} 

		
	
	
	return true;
	} 
	</script>

	<script>
		function hanyaAngka(evt) {
		  var charCode = (evt.which) ? evt.which : event.keyCode
		   if (charCode > 31 && (charCode < 48 || charCode > 57))
 
		    return false;
		  return true;
		}
	</script>

</head>
<body>
<?php banner();?>
<?php navigator();?>
Masukkan Jumlah Req bahan baku
<?php
if(isset($_GET["id_bbaku"])){
	$db=dbConnect();
	$id_bbaku=$db->escape_string($_GET["id_bbaku"]);
	if($data_bbaku=getDataReqBahanBaku($id_bbaku)){// cari data req, kalau ada simpan di $data
		?>
<a href="reqbb-tambah.php"><button>Pilih Bahan Baku</button></a>
<form method="post" name="frm" action="reqbb-simpan.php?id_bbaku=<?php echo $id_bbaku; ?>" onsubmit="return validasidata()">
<table border="1">

<tr><td>Id Bahan Baku</td>
    <td><input type="text" name="id_bbaku" size="16" maxlength="15"
	     value="<?php echo $data_bbaku["id_bbaku"];?>" readonly></td></tr>

<tr><td>Nama Bahan Baku</td>
    <td><input type="text" name="n_bbaku" size="30" maxlength="50"
		 value="<?php echo $data_bbaku["n_bbaku"];?>" readonly></td></tr>

<tr><td>Jumlah</td>
	<td><input type="text" name="jumlah" size="7" maxlength="6"
		 onkeypress='return hanyaAngka(event)' placeholder='Angka...'/></td></tr>

</form>

<td><input type="submit" name="TblSimpan" value="Simpan">
	    <input type="reset"></td></tr>
</table>
</form>
		<?php
	}
	else
		echo "Bahan Baku dengan Id : $id_bbaku tidak ada. Request dibatalkan";
?>
<?php
}
else
	echo "id_bbaku tidak ada. Request dibatalkan.";
?>
</body>
</html>