@extends('crudgenerator::layouts.master')

@section('content')


<h2 class="page-header">Renter</h2>

<div class="panel panel-default">
    <div class="panel-heading">
        Add/Modify Renter    </div>

    <div class="panel-body">
                
        <form action="{{ url('/renters'.( isset($model) ? "/" . $model->id : "")) }}" method="POST" class="form-horizontal">
            {{ csrf_field() }}

            @if (isset($model))
                <input type="hidden" name="_method" value="PATCH">
            @endif


                                                            <div class="form-group">
                <label for="renter_id" class="col-sm-3 control-label">Renter Id</label>
                <div class="col-sm-2">
                    <input type="number" name="renter_id" id="renter_id" class="form-control" value="{{$model['renter_id'] or ''}}">
                </div>
            </div>
                                                                                                                        <div class="form-group">
                <label for="renter_first_name" class="col-sm-3 control-label">Renter First Name</label>
                <div class="col-sm-6">
                    <input type="text" name="renter_first_name" id="renter_first_name" class="form-control" value="{{$model['renter_first_name'] or ''}}">
                </div>
            </div>
                                                                                                <div class="form-group">
                <label for="renter_last_name" class="col-sm-3 control-label">Renter Last Name</label>
                <div class="col-sm-6">
                    <input type="text" name="renter_last_name" id="renter_last_name" class="form-control" value="{{$model['renter_last_name'] or ''}}">
                </div>
            </div>
                                                            <div class="form-group">
                <label for="renter_tel" class="col-sm-3 control-label">Renter Tel</label>
                <div class="col-sm-6">
                    <input type="text" name="renter_tel" id="renter_tel" class="form-control" value="{{$model['renter_tel'] or ''}}">
                </div>
            </div>
                                                                                                                                    <div class="form-group">
                <label for="renter_sex" class="col-sm-3 control-label">Renter Sex</label>
                <div class="col-sm-6">
                    <input type="text" name="renter_sex" id="renter_sex" class="form-control" value="{{$model['renter_sex'] or ''}}">
                </div>
            </div>
                        
            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-6">
                    <button type="submit" class="btn btn-success">
                        <i class="fa fa-plus"></i> Save
                    </button> 
                    <a class="btn btn-default" href="{{ url('/renters') }}"><i class="glyphicon glyphicon-chevron-left"></i> Back</a>
                </div>
            </div>
        </form>

    </div>
</div>






@endsection