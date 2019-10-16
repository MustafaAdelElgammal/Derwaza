<?php
namespace app\Helper;
use Image;
class Helper  {

    public static function generateEnglishSlug($string){
        $slug = str_replace(' ', '-',  trim(strtolower($string)));
        $slug =  preg_replace('/[^A-Za-z0-9-]+/', '-', $slug);
        return $slug;
    }
    public static function getAllPhonesAttribute($value){
        $phones = explode(',',$value);
        if(is_array($phones)){return $phones;}
        return [];
    }
    public static function generateArabicSlug($string){
        $slug = str_replace(' ', '-',  trim($string));
        $slug = preg_replace('/[^\x{0600}-\x{06FF}A-Za-z0-9-]/u','', $slug);
        return $slug;
    }

    public static function  arquery($text){
        $replace = array("أ", "ا", "إ", "آ", "ي", "ى", "ه", "ة",);
        $with    = array("(أ|ا|آ|إ)", "(أ|ا|آ|إ)", "(أ|ا|آ|إ)", "(أ|ا|آ|إ)", "(ي|ى)", "(ي|ى)", "(ه|ة)", "(ه|ة)",);
        $new     = array_combine($replace,$with);

        $return = "" ;
        $len = strlen(utf8_decode($text));

        for($i=0;$i<$len;$i++){
            $current = mb_substr($text,$i,1,'utf-8');
            if(isset($new[$current])){
                $return.=$new[$current];
            }
            else{
                $return.=$current;
            }
        }
        return $return;
    }
    public static function make_slug($string = null, $separator = "-") {
        if (is_null($string)) {
            return "";
        }

        // Remove spaces from the beginning and from the end of the string
        $string = trim($string);

        // Lower case everything
        // using mb_strtolower() function is important for non-Latin UTF-8 string | more info: http://goo.gl/QL2tzK
        $string = mb_strtolower($string, "UTF-8");;

        // Make alphanumeric (removes all other characters)
        // this makes the string safe especially when used as a part of a URL
        // this keeps latin characters and arabic charactrs as well
        $string = preg_replace("/[^a-z0-9_\s-ءاأإآؤئبتثجحخدذرزسشصضطظعغفقكلمنهويةى]/u", "", $string);

        // Remove multiple dashes or whitespaces
        $string = preg_replace("/[\s-]+/", " ", $string);

        // Convert whitespaces and underscore to the given separator
        $string = preg_replace("/[\s_]/", $separator, $string);

        return $string;
    }
    public static function slugfy($string, $separator = '-'){
        $url = trim($string);

        $url = preg_replace('/[^a-z0-9_\s-ءاأإآؤئبتثجحخدذرزسشصضطظعغفقكلمنهويةى]/u', '', $url);
        $url = preg_replace('/\s+/', ' ', $url);
        $url = str_replace(' ', $separator, $url);

        return $url;
    }
    public static function limitString($text, $length = 200, $dots = true) {
        $text = trim(preg_replace('#[\s\n\r\t]{2,}#', ' ', $text));
        $text_temp = $text;
        while (substr($text, $length, 1) != " ") { $length++; if ($length > strlen($text)) { break; } }
        $text = substr($text, 0, $length);
        return $text . ( ( $dots == true && $text != '' && strlen($text_temp) > $length ) ? ' ...' : '');
    }
    public static function get_slug($string, $rmShortWords = false, $separator = '-') {
        $word_delimiters = array(' ', '|', '_', '(', ')', ',', '،');
        $word_delimiters = implode('', $word_delimiters);
        $words  = preg_split('/[' . $word_delimiters . ']/u', $string);
        $string = null;
        if ($rmShortWords) {
            foreach ($words as $k => $word) {
                if (mb_strlen($word) < 3) {
                    unset($words[$k]);
                }
            }
        }
        foreach ($words as $word) {
            $word = mb_strtolower($word);
            $word = mb_ereg_replace('[^\p{L}\p{Nd}]', '', $word);
            if (mb_strlen($word) < 1) {
                continue;
            }
            $string .= $word .= $separator;
        }
        return trim($string, $separator);
    }
    public static function deleteFile ($filename,$path,$sizes = null){
        if($filename == "")
            return;
        $filePath = $path . DIRECTORY_SEPARATOR . $filename;

        if (file_exists($filePath))
            unlink($filePath);
        if ($sizes != null)
            foreach($sizes as  $size){
                $fileSize = explode('_',preg_replace('/[^A-Za-z0-9\+_]/', '', $size));
                $filePath = $path . DIRECTORY_SEPARATOR . $fileSize[0] .'_' . $fileSize[1] . '_' . $filename;
                if (file_exists($filePath))
                    unlink($filePath);
            }
    }
    public static function doUploadImage($image,$folder,$sizes = false){
        $destinationPath = 'upload' . DIRECTORY_SEPARATOR . $folder ;
        $filename = time() .'_'.  str_replace(' ', '_', trim($image->getClientOriginalName()));
        $result = $image->move($destinationPath, $filename) ;
        if($sizes != false){
            foreach($sizes as  $size){
                $size =  explode('_',preg_replace('/[^A-Za-z0-9\+_]/', '', $size));
                $path = $destinationPath . '/' .$filename ;
                Image::make($path, array(
                    'width'  => $size[0],
                    'height' => $size[1]
                ))->save($destinationPath . '/' . $size[0] . '_'.$size[1] . '_'. $filename);
            }
        }
        return $result ? $filename : false;
    }
    public static function doUploadFile($file,$folder){
        $destinationPath = 'upload/'.$folder ;
        $fileName = time() .'_'.  str_replace(' ', '_', trim($file->getClientOriginalName()));
        $result = $file->move($destinationPath, $fileName);
        return $result ? $fileName : false;
    }
}
