<?php

namespace App\Http\Controllers\Web;

use App\Models\DishBranchPrice;
use App\Models\OrderList;
use Illuminate\Http\Request, Session, Redirect, Auth;
use App\Models\Cart, App\Models\Categories, App\Models\Dish;

class ShoppingController extends WebBaseController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function menu(Request $request)
    {
        $menus = Categories::all();
        $collection = Dish::whereIsActive(1)->with(['dishBranchPrice' => function($q){
            $q->whereBranchId($this->currentBranch->id);
        }]);
        $categorySlug = isset($request->categorySlug) ? $request->categorySlug : 'all';
        if ($categorySlug !== 'all') {
            $category = Categories::whereSlugEn($categorySlug)->first();
            if ($category){
                $collection->whereCategoryId($category->id);
            }
        }

        $min = isset($request->min) ? $request->min : null;
        $max = isset($request->max) ? $request->max : null;
        $r = DishBranchPrice::where('branch_id', $this->currentBranch->id)->whereIn('dish_id', $collection->lists('id'))->get();
        $dishes_rang = new \stdClass();
        $dishes_rang->max_price = $r->max('price');
        $dishes_rang->min_price = $r->min('price');
        if ($min !== null && $max != null){
            $collection->whereHas('dishBranchPrice', function($q)  use($min, $max) {
                $q->whereBranchId($this->currentBranch->id)->whereBetween('price', [$min - 0, $max + 0]);
            });
        }
        $dishes = $collection->orderby('created_at', 'desc')->paginate(12);
        $dishes->appends($request->input());
        if (isset($request->page)) {
            $return = view('site.shop.dish_list')->withDishes($dishes);
            if ($this::$isAjax) return response()->json(['html' => $return->render()]);
        }

        if ($request['page'] == null && $this::$isAjax) {
            $return = view('site.shop.dish_list')->withDishes($dishes);
            return response()->json(['html' => $return->render(), 'dishes_rang' => $dishes_rang], 200);
        }
        return view('site.shop.index')->withDishes($dishes)->withMenus($menus)->with('dishes_rang', $dishes_rang);
    }

    public function dish($crtegoryId, $dishSlug)
    {
        $dish = Dish::where( 'slug_ar', $dishSlug)
            ->orWhere( 'slug_en', $dishSlug)
            ->first();
        if($dishSlug === $dish->slug_en && Session::get('locale')  === 'ar'){
            return redirect()->to( Session::get('locale') . '/menu/'.$dish->category->slug_en . '/' . $dish->slug_ar);
        }else if($dishSlug === $dish->slug_ar && Session::get('locale')  === 'en'){
            return redirect()->to( Session::get('locale') . '/menu/'.$dish->category->slug_en . '/' . $dish->slug_en);
        }
        $related = [];
        if ($dish) {
            $related = Dish::whereIsActive(1)
                ->whereCategoryId($dish->category_id)
                ->where('id', '!=', $dish->id)
                ->orderByRaw("RAND()")->limit(3)->get();
        }

        return view('site.shop.single')->withDish($dish)->withRelateds($related);
    }

    public function getCart()
    {
        if (!Session::has('cart'))
            return view('site.shop.shopping-cart');

        $oldCart = Session::get('cart');
        $cart = new Cart($oldCart, $this->currentBranch);
        return view('site.shop.shopping-cart', ['products' => $cart->items, 'totalPrice' => $cart->totalPrice]);
    }

    public function getCartBox(Request $request)
    {
        $oldCart = Session::has('cart') ? Session::get('cart') : null;
        $cart = new Cart($oldCart, $this->currentBranch);
        $request->session()->put('cart', $cart);
        try {
            $return = view('site.shop.cartbox')->render();
            if ($this::$isAjax)
                return response()->json(['is_done' => true, 'cart' => $return], 200);
        } catch (\Throwable $e) {
        }
        return redirect()->back();
    }

    public function addToCart(Request $request, $id)
    {
        $dish = Dish::find($id);
        $oldCart = Session::has('cart') ? Session::get('cart') : null;
        $cart = new Cart($oldCart, $this->currentBranch);
        $cart->add($dish, $dish->id);
        $request->session()->put('cart', $cart);

        try {
            $return = view('site.shop.cartbox')->render();
            if ($this::$isAjax)
                return response()->json(['is_done' => true, 'cart' => $return], 200);
        } catch (\Throwable $e) {}
        return redirect()->back();
    }

    public function getIncrementByOne(Request $request, $id)
    {
        $dish = Dish::find($id);
        $oldCart = Session::has('cart') ? Session::get('cart') : null;
        $cart = new Cart($oldCart, $this->currentBranch);
        $cart->add($dish, $dish->id);
        $request->session()->put('cart', $cart);
        try {
            $return = view('site.shop.cartbox')->render();
            $returnPage = view('site.shop.cart-page', ['products' => $cart->items, 'totalPrice' => $cart->totalPrice])->render();
            if ($this::$isAjax)
                return response()->json(['is_done' => true, 'count' => $cart->totalQty, 'cart' => $return, 'cart_page' => $returnPage], 200);
        } catch (\Throwable $e) {}
        return redirect()->back();
    }

    public function getDecrementByOne($id)
    {
        $oldCart = Session::has('cart') ? Session::get('cart') : null;
        $cart = new Cart($oldCart, $this->currentBranch);
        $cart->reduceByOne($id);
        if (count($cart->items) > 0) {
            Session::put('cart', $cart);
        } else {
            Session::forget('cart');
        }
        try {
            $return = view('site.shop.cartbox')->render();
            $returnPage = view('site.shop.cart-page', ['products' => $cart->items, 'totalPrice' => $cart->totalPrice])->render();
            if ($this::$isAjax)
                return response()->json(['is_done' => true, 'count' => $cart->totalQty, 'cart' => $return, 'cart_page' => $returnPage], 200);
        } catch (\Throwable $e) {}
        return redirect()->back();
    }

    public function getRemoveItem($id)
    {
        $oldCart = Session::has('cart') ? Session::get('cart') : null;
        $cart = new Cart($oldCart, $this->currentBranch);
        $cart->removeItem($id);
        if (count($cart->items) > 0) {
            Session::put('cart', $cart);
        } else {
            Session::forget('cart');
        }
        try {
            $return = view('site.shop.cartbox')->render();
            $returnPage = view('site.shop.cart-page', ['products' => $cart->items, 'totalPrice' => $cart->totalPrice])->render();
            if ($this::$isAjax)
                return response()->json(['is_done' => true, 'count' => $cart->totalQty, 'cart' => $return, 'cart_page' => $returnPage], 200);
        } catch (\Throwable $e) {}
        return redirect()->back();
    }

}