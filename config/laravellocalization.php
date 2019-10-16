<?php

return [
    // Uncomment the languages that your site supports - or add new ones.
    // These are sorted by the native name, which is the order you might show them in a language selector.
    // Regional languages are sorted by their base language, so "British English" sorts as "English, British"
    'supportedLocales' => [
        'ar' => ['name' => 'Arabic',  'script' => 'Arab', 'native' => 'العربية', 'regional' => 'ar_AE'],
        'en' => ['name' => 'English', 'script' => 'Latn', 'native' => 'English', 'regional' => 'en_GB'],
    ],
    // Negotiate for the user locale using the Accept-Language header if it's not defined in the URL?
    // If false, system will take app.php locale attribute
    'useAcceptLanguageHeader' => true,

    // If LaravelLocalizationRedirectFilter is active and hideDefaultLocaleInURL
    // is true, the url would not have the default application language
    //
    // IMPORTANT - When hideDefaultLocaleInURL is set to true, the unlocalized root is treated as the applications default locale "app.locale".
    // Because of this language negotiation using the Accept-Language header will NEVER occur when hideDefaultLocaleInURL is true.
    //
    'hideDefaultLocaleInURL' => false,

    // If you want to display the locales in particular order in the language selector you should write the order here. 
    //CAUTION: Please consider using the appropriate locale code otherwise it will not work
    //Example: 'localesOrder' => ['es','en'],
    'localesOrder' => [],
];
