<?php

namespace App\Exceptions;
use Exception;
use Illuminate\Validation\ValidationException;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Redirect;
class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that should not be reported.
     *
     * @var array
     */
    protected $dontReport = [
        AuthorizationException::class,
        HttpException::class,
        ModelNotFoundException::class,
        ValidationException::class,
    ];

    /**
     * Report or log an exception.
     *
     * This is a great spot to send exceptions to Sentry, Bugsnag, etc.
     *
     * @param  \Exception  $e
     * @return void
     */
    public function report(Exception $e)
    {
        parent::report($e);
    }

    /**
     * Render an exception into an HTTP response.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Exception  $e
     * @return \Illuminate\Http\Response
     */
    public function render($request, Exception $e){
//        if(request()->segment(1) != 'admin' && !$request->ajax()) return Redirect::to('errors');
        return parent::render($request, $e);
    }

    public function renderHttpException(HttpException $e) {
        // to get status code ie 404, 503, 500
        $status = $e->getStatusCode();
        if(request()->segment(1) != 'admin'){
            if (in_array($status,[404,503,500])) {
                return Redirect::to('errors');
            }
        }
        return $this->convertExceptionToResponse($e);
    }
}
