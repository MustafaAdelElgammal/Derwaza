@extends("admin.$layout")
@section('content')
    <div class="pageheader"><h2><i class="fa {{$module->icon}}"></i> {{$module->name_en}}</h2></div>
    <div class="contentpanel">
        @if($module->view_style == 'style_1')
            <div class="people-list">
                <div class="row load-more-ajax-wrapper" id="multi">
                    @include('admin.posts.data')
                </div><!-- row -->
            </div>
        @elseif($module->view_style == 'style_2')
            <div class="people-list">
                <div class="row load-more-ajax-wrapper" id="multi">
                    @include('admin.posts.data')
                </div><!-- row -->
            </div>
        @elseif($module->view_style == 'style_3')
            <div class="table-responsive">
                <table class="table table-hidaction table-hover mb30">
                    <thead>
                        <tr>
                            {{--<th>ID</th>--}}
                            <th>@lang('admin.title')</th>
                            @if($module->have_categories) <th>@lang('admin.category')</th> @endif
                            @if($module->have_parent_module) <th>@lang('admin.category')</th> @endif
                            @if($module->have_status) <th>@lang('admin.item_status')</th> @endif
                            <th></th>
                        </tr>
                    </thead>
                    <tbody class="load-more-ajax-wrapper" id="multi">
                        @include('admin.posts.data')
                    </tbody>
                </table>
            </div>
        @endif
        @if($module->have_ordered) <button id="sort-button_save" class="hidden" value="{{ csrf_token() }}"></button> @endif
    </div>
@endsection
