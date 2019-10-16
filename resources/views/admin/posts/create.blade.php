@extends("admin.$layout")
@section('content')
<div class="pageheader"><h2><i class="fa {{$module->icon}}"></i> {{$module->name_en}}</h2></div>
<div class="contentpanel">
    <div class="row">
        <div class="col-md-12">
            @if($module->have_add_new == 1)
                @if($module->have_parent_module && count($parents) == 0)
                    <label>@lang('admin.please_create_category') {{ $module->name_en}} @lang('admin.fristly')</label>
                @else
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="panel-btns"><a href="#" class="minimize">&minus;</a></div>
                            <h4 class="panel-title">@lang('admin.add_record_to') {{$module->name_en}}</h4>
                        </div>
                        <div class="panel-body panel-body-nopadding">
                            <div class="basic-wizard wizard form-wizard" id="progressWizard">
                                {{ Form::open(array('url' => 'admin/posts' ,'class' => 'submit-ajax general-form', 'files'=>true, 'id' => 'create_'.$module->slug)) }}
                                    {{ Form::hidden('module_id',$module->id ) }}
                                    @if($module->have_status || $module->have_parent_module)
                                        <div class="tab-pane" style=" background: #f6f6f6;">
                                            @if($module->have_status)
                                                <div class="col-md-2">
                                                    {{Markup::selectOptionMaterial(trans('admin.item_status') ,'status',['null'=>trans('admin.select_status'),'0'=>trans('admin.published') , '1' =>trans('admin.not_published')],'0',null)}}
                                                </div>
                                            @endif

                                            @if($module->have_parent_module)
                                                <div class="col-md-5">
                                                    @if(!empty($parents))
                                                        <div class="form-group label-floating">
                                                            <label for="parent_id" class="control-label">@lang('admin.category')</label>
                                                            <select class="form-control" id="parent_id" name="parent_id">
                                                                <option value="null" disabled="disabled">@lang('admin.Select_category')</option>
                                                                @foreach($parents as $parent)
                                                                    <option value="{{$parent->id}}">{{$parent->postByLang->name}}</option>
                                                                @endforeach
                                                            </select>
                                                            <span class="help-block"></span>
                                                        </div>
                                                    @else
                                                        <label>@lang('admin.please_create_category')</label>
                                                    @endif
                                                </div>
                                            @endif
                                        </div>
                                    @endif

                                    <ul class="nav nav-tap nav-justified">
                                        @foreach($languages as $language)
                                            <li><a href="#tab-{{ $language }}" data-toggle="tab"><span> @lang('admin.'.$language)</span></a></li>
                                        @endforeach
                                    </ul>
                                    <div class="tab-content">
                                        @foreach($languages as $language)
                                            <div class="tab-pane" id="tab-{{$language}}">
                                                @include('admin.posts.form')
                                            </div>
                                        @endforeach
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <ul class="pager wizard">
                                        <li class="previous"><a href="javascript:void(0)">@lang('admin.previous')</a></li>
                                        <li class="next"><a href="javascript:void(0)">@lang('admin.next')</a></li>
                                        <li class="finish"><button class='btn btn-block btn-default submit-finish' ><i class='fa fa-refresh'></i> @lang('admin.save')</button></li>
                                    </ul>
                                {{ Form::close() }}
                            </div>
                        </div>
                    </div>
                @endif
            @endif
        </div>
    </div>
</div>
@endsection
