<?php namespace app\Pagination;
use Illuminate\Pagination\BootstrapThreePresenter;

class AcmePresenter extends BootstrapThreePresenter {

    public function render() {
        if ($this->hasPages()) {
            return sprintf(
                //$this->getFirst(),
                //$this->getButtonPre(),
                $this->getButtonNext()
                //$this->getLast()
            );
        }
        return "";
    }
    public function getLast() {
        $url = $this->paginator->url($this->paginator->lastPage());
        $btnStatus = '';

        if($this->paginator->lastPage() == $this->paginator->currentPage()){
            $btnStatus = 'disabled';
        }
        return $btn = "<a href='".$url."'><button class='btn btn-success ".$btnStatus."'>Last <i class='glyphicon glyphicon-chevron-right'></i></button></a>";
    }
    public function getFirst() {
        $url = $this->paginator->url(1);
        $btnStatus = '';

        if(1 == $this->paginator->currentPage()){
            $btnStatus = 'disabled';
        }
        return $btn = "<a href='".$url."'><button class='btn btn-success ".$btnStatus."'><i class='glyphicon glyphicon-chevron-left'></i> First</button></a>";
    }
    public function getButtonPre() {
        $url = $this->paginator->previousPageUrl();
        $btnStatus = '';

        if(empty($url)){
            $btnStatus = 'disabled';
        }
        return $btn = "<a href='".$url."'><button class='btn btn-success ".$btnStatus."'><i class='glyphicon glyphicon-chevron-left pagi-margin'></i><i class='glyphicon glyphicon-chevron-left'></i> Previous </button></a>";
    }
    public function getButtonNext() {
        $url = $this->paginator->nextPageUrl();
        $btnStatus = '';

        if(!empty($url)){
            return $btn = "<a href='".$url."' class='btn btn-theme-alt btn-md load-more-ajax'>".trans('admin.load_more')." <i class='fa fa-right'></i></a>";
        }
        return '';
    }

}
