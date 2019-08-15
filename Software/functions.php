<?php
define("DEVELOPMENT",TRUE);
function dbConnect(){
	$db=new mysqli("localhost","root","","kura_resto");
	return $db;
}

class con{
    public $db;

    public function __construct()
    {
        if(!$this->db){
            try{
				$this->db = new mysqli("localhost","root","","kura_resto");
            }catch (PDOException $e){
                echo "Connection Error";
                echo $e;
            }
        }

    }
}

function getDataPegawai($id_pegawai){
	$db=dbConnect();
	if($db->connect_errno==0){
		$res=$db->query("SELECT * FROM pegawai WHERE id_pegawai = '$id_pegawai'");
		if($res){
			if($res->num_rows>0){
				$data=$res->fetch_assoc();
				$res->free();
				return $data;
			}
			else
				return FALSE;
		}
		else
			return FALSE; 
	}
	else
		return FALSE;
}
function getDataMeja($no_meja){
	$db=dbConnect();
	if($db->connect_errno==0){
		$res=$db->query("SELECT * FROM meja WHERE no_meja = '$no_meja'");
		if($res){
			if($res->num_rows>0){
				$data=$res->fetch_assoc();
				$res->free();
				return $data;
			}
			else
				return FALSE;
		}
		else
			return FALSE; 
	}
	else
		return FALSE;
}

function navigatorpemilik(){
	?>
<div id="navigator">
| <a href="pegawai.php">Pegawai</a> 
| <a href="meja.php">Meja</a> 
| <a href="../logout.php">Log Out</a>
| 
</div>
	<?php
}
function banner(){
		?>
	<div id="banner"><h1>Resto Kura</h1>
	</div>
		<?php
}