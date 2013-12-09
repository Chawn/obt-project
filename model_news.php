<?
class news extends CI_Model {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	private $folder = 'news' ;

	public function addData($data)
	{	
	    $this->db->insert('news',$data);
	    return $this->db->insert_id();
	}

	public function getData()
	{	
		$query = $this->db->get('news');
		return $query ;
	}
	public function getDataWhere($column1,$column2)
	{
		$query = $this->db->get_where('news',array($column1=>$column2));
		return $query ;
	}
	public function getCover($album_id)
	{	
		$query_cover = $this->db->get_where('picture',array('album_id'=>$album_id,'cover'=>'used','folder'=>$this->folder));
		if ($query_cover->num_rows>0) { //มีภาพที่ตั้งเป็น cover
			$cover = $query_cover->row();
			$img = "<img src='".$cover->url."'>" ;
		}else{
			$query_cover = $this->db->get_where('picture',array('album_id'=>$album_id,'folder'=>$this->folder));
			if ($query_cover->num_rows>0) { //มีภาพข่าว แต่ไม่มี cover
				$cover = $query_cover->row();
				$img = "<img src='".$cover->url."'>" ;
			}else{ //ไม่มีภาพในข่าวเลย
				$img = "<img src='".base_url()."img/none.png'>" ;
			}
		}
		return $img ;
	}
	public function delete($id)
	{
		$this->db->delete('news', array('id' => $id)); 
	}

	public function getTool($id)
	{
		$user = $this->user->isUserLogin() ;
		if($user!=""){   
			$html 	=   "<div class='tool-pic btn-group pull-right'>
      						<a class='btn' href='".base_url()."home/dashboard/news-add?id=".$id."'>
      							<i class='icon-pencil'></i> แก้ไข
      						</a>
					    </div>" ;
			echo $html ;
		}
	}

	


}

?>

