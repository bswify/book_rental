<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Renter;

use DB;

class RentersController extends Controller
{
  //
  public function __construct()
  {
    //$this->middleware('auth');
  }


  public function index(Request $request)
  {
    return view('renters.index', []);
  }

  public function create(Request $request)
  {
    return view('renters.add', [
      []
    ]);
  }

  public function edit(Request $request, $id)
  {
    $renter = Renter::findOrFail($id);
    return view('renters.add', [
      'model' => $renter    ]);
  }

  public function show(Request $request, $id)
  {
    $renter = Renter::findOrFail($id);
    return view('renters.show', [
      'model' => $renter    ]);
  }

  public function grid(Request $request)
  {
    $len = $_GET['length'];
    $start = $_GET['start'];

    $select = "SELECT *,1,2 ";
    $presql = " FROM renters a ";
    if($_GET['search']['value']) {
      $presql .= " WHERE renter_first_name LIKE '%".$_GET['search']['value']."%' ";
    }

    $presql .= "  ";

    //------------------------------------
    // 1/2/18 - Jasmine Robinson Added Orderby Section for the Grid Results
    //------------------------------------
    $orderby = "";
    $columns = array('renter_id','renter_first_name','renter_last_name','renter_tel','renter_sex',);
    $order = $columns[$request->input('order.0.column')];
    $dir = $request->input('order.0.dir');
    $orderby = "Order By " . $order . " " . $dir;

    $sql = $select.$presql.$orderby." LIMIT ".$start.",".$len;
    //------------------------------------

    $qcount = DB::select("SELECT COUNT(a.id) c".$presql);
    //print_r($qcount);
    $count = $qcount[0]->c;

    $results = DB::select($sql);
    $ret = [];
    foreach ($results as $row) {
      $r = [];
      foreach ($row as $value) {
        $r[] = $value;
      }
      $ret[] = $r;
    }

    $ret['data'] = $ret;
    $ret['recordsTotal'] = $count;
    $ret['iTotalDisplayRecords'] = $count;

    $ret['recordsFiltered'] = count($ret);
    $ret['draw'] = $_GET['draw'];

    echo json_encode($ret);

  }


  public function update(Request $request) {
    //
    /*$this->validate($request, [
    'name' => 'required|max:255',
  ]);*/
  $renter = null;
  if($request->id > 0) { $renter = Renter::findOrFail($request->id); }
  else {
    $renter = new Renter;
  }


  
      $renter->renter_id = $request->renter_id;
  
  
      $renter->renter_first_name = $request->renter_first_name;
  
  
      $renter->renter_last_name = $request->renter_last_name;
  
  
      $renter->renter_tel = $request->renter_tel;
  
  
      $renter->renter_sex = $request->renter_sex;
  
    //$renter->user_id = $request->user()->id;
  $renter->save();

  return redirect('/renters');

}

public function store(Request $request)
{
  return $this->update($request);
}

public function destroy(Request $request, $id) {

  $renter = Renter::findOrFail($id);

  $renter->delete();
  return "OK";

}


}
