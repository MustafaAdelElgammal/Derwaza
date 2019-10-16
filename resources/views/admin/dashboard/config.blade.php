@extends("admin.$layout")
@section('content')
<div class="pageheader"><h2><i class="fa fa-cogs"></i> @lang('admin.configurations')</h2></div>
<div class="contentpanel">
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-btns"><a href="#" class="minimize minimize">-</a></div>
                    <h4 class="panel-title">@lang('admin.website_language')</h4>
                </div>
                <div class="panel-body">
                    {{ Form::open(array('url' => 'admin/configuration/main/site_language', 'class' => 'submit-ajax')) }}
                    <div class="col-md-12">{{Markup::selectOptionMaterial(trans('admin.site_language') ,'site_lang_default',$selectedLang,$siteConfig->site_lang_default)}}</div>
                    <div class="col-md-12">
                        <button class='btn btn-block btn-default submit-finish' ><i class='fa fa-refresh'></i> @lang('admin.save')</button>
                    </div>
                    {{ Form::close() }}
                </div><!-- panel-body -->
            </div><!-- panel -->
        </div>

        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-btns"><a href="#" class="minimize minimize">-</a></div>
                    <h4 class="panel-title">@lang('admin.website_status')</h4>
                </div>
                <div class="panel-body">
                    {{ Form::open(array('url' => 'admin/configuration/main/site_status', 'class' => 'submit-ajax')) }}
                    <div class="col-md-12">{{Markup::selectOptionMaterial(trans('admin.website_status') , 'site_status', [null => trans('admin.select_status'),'0' => trans('admin.closed'),'1' => trans('admin.open')],$siteConfig->site_status)}}</div>
                    <div class="col-md-12">
                        <button class='btn btn-block btn-default submit-finish' ><i class='fa fa-refresh'></i> @lang('admin.save')</button>
                    </div>
                    {{ Form::close() }}
                </div><!-- panel-body -->
            </div><!-- panel -->
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-btns"><a href="#" class="minimize minimize">-</a></div>
                    <h4 class="panel-title">@lang('admin.main_information')</h4>
                </div>
                <div class="panel-body">
                    {{ Form::open(array('url' => 'admin/configuration/main', 'class' => 'submit-ajax general-form', 'id' => 'main_config')) }}
                        @foreach($siteConfigs as $site)
                            <div class="col-md-12">{{Markup::textInputMaterial('Site name (' . $site->config_lang . ')', 'site_name_' . $site->config_lang, $site->site_name, $errors->first('site_name_' . $site->config_lang), 60)}}</div>
                        @endforeach
                        <div class="col-md-12">{{Markup::textInputMaterial(trans('admin.general_phone'), 'site_phone', $siteConfig->site_phone , $errors->first('site_phone'), 8, "validateWithoutZero(event)")}}</div>
                        <div class="col-md-12 mb30">{{Markup::textInputMaterial(trans('admin.general_email'), 'site_email', $siteConfig->site_email , $errors->first('site_email'))}}</div>
                        {{--<div class="col-md-6">{{Markup::textInputMaterial(trans('admin.fax'), 'site_fax_'.$site->config_lang , $site->site_fax)}}</div>--}}
                    <button class='btn btn-block btn-default submit-finish' ><i class='fa fa-refresh'></i> @lang('admin.save')</button>
                    {{ Form::close() }}
                </div><!-- panel-body -->
            </div><!-- panel -->
        </div>

        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-btns"><a href="#" class="minimize minimize">-</a></div>
                    <h4 class="panel-title">Website SEO</h4>
                </div>
                <div class="panel-body">
                    {{ Form::open(array('url' => 'admin/configuration/main/site_seo', 'class' => 'submit-ajax')) }}
                    @foreach($siteConfigs as $site)
                        <div class="col-md-12">{{Markup::textAreaMaterial(trans('admin.description') . ' ' . $site->config_lang, 'site_desc_'.$site->config_lang , $site->site_desc,5 )}}</div>
                    @endforeach
                    <div class="col-md-12"><button class='btn btn-block btn-default submit-finish' ><i class='fa fa-refresh'></i> @lang('admin.save')</button></div>
                    {{ Form::close() }}
                </div><!-- panel-body -->
            </div><!-- panel -->
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-btns"><a href="#" class="minimize minimize">-</a></div>
                    <h4 class="panel-title">@lang('admin.social_media-links')</h4>
                </div>
                <div class="panel-body">
                    {{ Form::open(array('url' => 'admin/configuration/main/site_social', 'class' => 'submit-ajax', 'id' => 'social_config')) }}
                    <div class="hidden" id='template_input_social'>
                        <div class="item-wrap">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <input class="form-control" type="text" name="social_site[]">
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="form-group">
                                    <input class="form-control" type="text" name="social_link[]" value="http://www.example.com">
                                </div>
                            </div>
                            @if(Auth::User()->role_id == 1)
                                <div class="col-md-2"><div class="form-group"><button class="btn btn-danger remove_field" type="button">@lang('admin.remove')</button></div></div>
                            @endif
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="input_fields_wrap_social">
                            @if(is_array($siteConfig->social))
                                <?php $i=0?>
                                @foreach($siteConfig->social as $social)
                                    <div class="item-wrap">
                                        <div style="display: none"><div class="form-group"><input  readonly value="{{ $social['site'] }}" class="form-control hidden" type="text" name="social_site[]" placeholder="Social name"></div></div>
                                        <div class="col-md-12">
                                            <div class="form-group label-floating">
                                                <label for='social_link_{{$i}}' class='control-label'>{{ $social['site'] }}</label>
                                                <input id="social_link_{{$i}}" value="{{ $social['link'] }}" class="form-control" type="text" name="social_link[]">
                                            </div>
                                        </div>
                                        @if(Auth::User()->role_id == 1)
                                            <div class="col-md-12"><div class="form-group"><button class="btn btn-danger remove_field" type="button">@lang('admin.remove')</button></div></div>
                                        @endif
                                    </div>
                                    <?php $i++;?>
                                @endforeach
                            @endif
                            @if(Auth::User()->role_id == 1)
                                <button class="btn btn-block btn-default add_field_button_social" type="submit"><i class="fa fa-plus-squared"></i>@lang('admin.add_more_links')</button><br />
                            @endif
                        </div>
                    </div>
                    <div class="col-md-12"><button class='btn btn-block btn-default submit-finish' ><i class='fa fa-refresh'></i> @lang('admin.save')</button></div>
                    {{ Form::close() }}
                </div><!-- panel-body -->
            </div><!-- panel -->
        </div>
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-btns"><a href="#" class="minimize minimize">-</a></div>
                    <h4 class="panel-title">Google Analysis Script</h4>
                </div>
                <div class="panel-body">
                    {{ Form::open(array('url' => 'admin/configuration/main/site_google_analysis', 'class' => 'submit-ajax')) }}
                        <div class="col-md-12">{{Markup::textAreaMaterial('Google Analysis Script', 'site_keyword', $siteConfig->site_keyword, 19)}}</div>
                        <div class="col-md-12"><button class='btn btn-block btn-default submit-finish' ><i class='fa fa-refresh'></i> @lang('admin.save')</button></div>
                    {{ Form::close() }}
                </div><!-- panel-body -->
            </div><!-- panel -->
        </div>
    </div>
</div>
@endsection
