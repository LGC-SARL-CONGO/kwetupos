@extends('layouts.auth2')
@section('title', config('app.name', 'ultimatePOS'))
@inject('request', 'Illuminate\Http\Request')
@section('content')
<div class="col-md-12 col-sm-12 col-xs-12 h-full bg-inherit tw-pt-20 tw-pb-10 tw-px-5 tw-flex tw-flex-col tw-items-center tw-justify-center">
    <div class="tw-text-6xl tw-font-extrabold tw-text-center tw-text-white tw-px-4 tw-py-2 tw-rounded-md">
        {{ config('app.name', 'UltimatePOS') }}
    </div>
    
    <p class="tw-text-lg tw-font-medium tw-text-center tw-text-white tw-mt-2 tw-shadow-md tw-bg-blue-600 tw-rounded-md tw-px-3 tw-py-1">
        {{ env('APP_TITLE', '') }}
    </p>
    @include('layouts.chat_bot.chatBot')
</div>

@endsection