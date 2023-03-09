# This file is generated by composer-plugin-nixify.
# Manual changes might be lost - proceed with caution!

{ lib, php, phpPackages, unzip, stdenv, runCommandLocal, writeText, fetchurl

# Default fetcher.
, fetcher ? (args: fetchurl { inherit (args) name urls sha256; })

}: src:

with lib;

let

  composerPath = phpPackages.composer.src;
  cacheEntries = [
    { name = "asm89_stack-cors-2.1.1.0"; filename = "asm89/stack-cors/7e498c1dcc85a53c8c957f6f59d177ab29b8758c.zip"; sha256 = "30b655e9de8e835872c3c075d792b77ebd36b3175a5099586c42ad34b88eb7c5"; urls = [ "https://api.github.com/repos/asm89/stack-cors/zipball/73e5b88775c64ccc0b84fb60836b30dc9d92ac4a" ]; }
    { name = "composer_installers-2.2.0.0"; filename = "composer/installers/3447ad284195762f64126aeb1c751aad458dfd8a.zip"; sha256 = "9915f695f562ddaac473a7da5807a6bc0dc348e646be43995fae38dadc6aa215"; urls = [ "https://api.github.com/repos/composer/installers/zipball/c29dc4b93137acb82734f672c37e029dfbd95b35" ]; }
    { name = "composer_semver-3.3.2.0"; filename = "composer/semver/29fa63f52104d4c4bf687735fbaaf52f0a232c4b.zip"; sha256 = "baaee53811af1c73fa17da54c1722c888207008eac70d0f239073fb13e24e56a"; urls = [ "https://api.github.com/repos/composer/semver/zipball/3953f23262f2bff1919fc82183ad9acb13ff62c9" ]; }
    { name = "doctrine_annotations-1.13.3.0"; filename = "doctrine/annotations/6185e4843a8f5c9d48f8518572b216612da202a5.zip"; sha256 = "a74c0120363de1eea6d324b92324e3b99e81e179553f269fb0ca5cac7cc07d56"; urls = [ "https://api.github.com/repos/doctrine/annotations/zipball/648b0343343565c4a056bfc8392201385e8d89f0" ]; }
    { name = "doctrine_lexer-1.2.3.0"; filename = "doctrine/lexer/4ab8440502eac4ce094502573b529bcbae3991e3.zip"; sha256 = "1a329ce6ee5b48d38f7455631d0f9abd122643b304a112a6a76a50496d32e089"; urls = [ "https://api.github.com/repos/doctrine/lexer/zipball/c268e882d4dbdd85e36e4ad69e02dc284f89d229" ]; }
    { name = "drupal_core-10.0.4.0"; filename = "drupal/core/3edb419287a546d627592e418c4ec160d4843a3c.zip"; sha256 = "2c50056134970728c1cded3afb32fb2a13b0158507bc2aa982b98210ac87520e"; urls = [ "https://api.github.com/repos/drupal/core/zipball/d4051f23e51522703e3c26ecbc147449ba88eccc" ]; }
    { name = "drupal_core-composer-scaffold-10.0.4.0"; filename = "drupal/core-composer-scaffold/1f35c4ac28e6bc49ef2db0fcf7ef464827b42ca0.zip"; sha256 = "8e3892f0de7e45e3bee932e1eb3347947830c50c976a80c7cf8e82c51a1489f3"; urls = [ "https://api.github.com/repos/drupal/core-composer-scaffold/zipball/e3f17745ab88a919f5179e6d9c1ac8ce77d3845f" ]; }
    { name = "drupal_core-recommended-10.0.4.0"; filename = "drupal/core-recommended/ad04d973524888ddfe6c99dddaee5eb23f6e046e.zip"; sha256 = "88277adcf38f146ed743ffa9e76a226b45424a04b91e7d9f6f98066337e68eaf"; urls = [ "https://api.github.com/repos/drupal/core-recommended/zipball/88f1c7796f6f610a2cf7dffc354dd6f6abf2ccfb" ]; }
    { name = "egulias_email-validator-3.2.5.0"; filename = "egulias/email-validator/fbd93f281d2a45219617370e886cd79b5143b67b.zip"; sha256 = "ec59ebdc8df85e80c9a207c38b15fda8a84f38d5a25a2da5f017210b6e6b230c"; urls = [ "https://api.github.com/repos/egulias/EmailValidator/zipball/b531a2311709443320c786feb4519cfaf94af796" ]; }
    { name = "guzzlehttp_guzzle-7.5.0.0"; filename = "guzzlehttp/guzzle/01743f83cc505a0464ba7a1a4507444403a079c7.zip"; sha256 = "37ddb40b16d8df64994dd3cdd41011109fe34ff02c4c00252adda9093212c833"; urls = [ "https://api.github.com/repos/guzzle/guzzle/zipball/b50a2a1251152e43f6a37f0fa053e730a67d25ba" ]; }
    { name = "guzzlehttp_promises-1.5.2.0"; filename = "guzzlehttp/promises/691eab84bb1e9e2a0b452c7fed0eb1f67862a516.zip"; sha256 = "e8efd4c91f3b0302c055cfcbeba9d869a93db8aad2b7f3242e257555fc616aef"; urls = [ "https://api.github.com/repos/guzzle/promises/zipball/b94b2807d85443f9719887892882d0329d1e2598" ]; }
    { name = "guzzlehttp_psr7-2.4.4.0"; filename = "guzzlehttp/psr7/c09c36b9113f2c4bc79b0530e5bcf5173b9415da.zip"; sha256 = "72e4dafac9616eb3839f4e7819249edd3e8eaa16eb01b55553e2bbb4f7f4f6fd"; urls = [ "https://api.github.com/repos/guzzle/psr7/zipball/3cf1b6d4f0c820a2cf8bcaec39fc698f3443b5cf" ]; }
    { name = "masterminds_html5-2.7.6.0"; filename = "masterminds/html5/08fb32e7137a83b9af783ead1339857fe23ac90e.zip"; sha256 = "13303fbc8ce9e49c8229911922b83d06109deb1873b36b29050ec09af563d589"; urls = [ "https://api.github.com/repos/Masterminds/html5-php/zipball/897eb517a343a2281f11bc5556d6548db7d93947" ]; }
    { name = "pear_archive_tar-1.4.14.0"; filename = "pear/archive_tar/ef0789774cf1206615c143664f24d792e4b6fc68.zip"; sha256 = "72472b0adf4711ce377f5107842700cf31dc4b52033a2d5346a68d3bfaeb5798"; urls = [ "https://api.github.com/repos/pear/Archive_Tar/zipball/4d761c5334c790e45ef3245f0864b8955c562caa" ]; }
    { name = "pear_console_getopt-1.4.3.0"; filename = "pear/console_getopt/7dfb60dd14495e47f9e14d051b6f01a660ece167.zip"; sha256 = "b4eed79039bc4d20e59d540bb85396666445b8c6a6bd1bc04017cca49bd2169c"; urls = [ "https://api.github.com/repos/pear/Console_Getopt/zipball/a41f8d3e668987609178c7c4a9fe48fecac53fa0" ]; }
    { name = "pear_pear-core-minimal-1.10.11.0"; filename = "pear/pear-core-minimal/7b54f786508ffd8c3fb271aefe91225f35d7bdab.zip"; sha256 = "f838013a20895f744cd58a91112a3f9ba8b76cf1ef655363c0da94698eec613e"; urls = [ "https://api.github.com/repos/pear/pear-core-minimal/zipball/68d0d32ada737153b7e93b8d3c710ebe70ac867d" ]; }
    { name = "pear_pear_exception-1.0.2.0"; filename = "pear/pear_exception/c6c1b248c4f91b0f5a9c73f5c701d341bdf0de4d.zip"; sha256 = "6971a771990ae8081d2b0f1c2126447684e92ace553a9003e5651afec2e3f64d"; urls = [ "https://api.github.com/repos/pear/PEAR_Exception/zipball/b14fbe2ddb0b9f94f5b24cf08783d599f776fff0" ]; }
    { name = "psr_cache-3.0.0.0"; filename = "psr/cache/b7eac5d329f3f43db02b28fa0fef1a15080f3536.zip"; sha256 = "88d63083b654a7ca847e926fcf8e3c35b0a7dd1bde960d8674ba10b2b8f4361f"; urls = [ "https://api.github.com/repos/php-fig/cache/zipball/aa5030cfa5405eccfdcb1083ce040c2cb8d253bf" ]; }
    { name = "psr_container-2.0.2.0"; filename = "psr/container/a0a43e15cb16e3ab95a991e1bffc813474b15cdf.zip"; sha256 = "3111f5b69d3a0f690f5f92d7aeacfb247f5ebd3c175088cce4b098e5d1b06ad7"; urls = [ "https://api.github.com/repos/php-fig/container/zipball/c71ecc56dfe541dbd90c5360474fbc405f8d5963" ]; }
    { name = "psr_event-dispatcher-1.0.0.0"; filename = "psr/event-dispatcher/8f60a8cd1b7ff4e8f9782d70d78dee877a526529.zip"; sha256 = "4d6a674cfd89a9957ead82e31ee4df785b2b1d215693add73184729a9a66d116"; urls = [ "https://api.github.com/repos/php-fig/event-dispatcher/zipball/dbefd12671e8a14ec7f180cab83036ed26714bb0" ]; }
    { name = "psr_http-client-1.0.1.0"; filename = "psr/http-client/9ef0ac1a0bb8280477e24c9232fac374ed3024ac.zip"; sha256 = "fb98c497fe0d21d34c55622f687766e22198037a3c073fec44394439948bb332"; urls = [ "https://api.github.com/repos/php-fig/http-client/zipball/2dfb5f6c5eff0e91e20e913f8c5452ed95b86621" ]; }
    { name = "psr_http-factory-1.0.1.0"; filename = "psr/http-factory/554dafa2f4680a78fa693cedcbe62bc6873809db.zip"; sha256 = "baedc0aa21248f8a0316a8b78c98754cf7c4b3fe8ab7a4da5ad0adc22eb6cb46"; urls = [ "https://api.github.com/repos/php-fig/http-factory/zipball/12ac7fcd07e5b077433f5f2bee95b3a771bf61be" ]; }
    { name = "psr_http-message-1.0.1.0"; filename = "psr/http-message/cc1d4e9ee13f2053b80c08976256789bf3be5256.zip"; sha256 = "8538467ca2665fe15574f4d2506871823f71fd24b9a9284aae2ba90d8f69ada4"; urls = [ "https://api.github.com/repos/php-fig/http-message/zipball/f6561bf28d520154e4b0ec72be95418abe6d9363" ]; }
    { name = "psr_log-3.0.0.0"; filename = "psr/log/4109d4b3f74b78a13cb175029bcb2384f59f0a52.zip"; sha256 = "bbc23516c85615f2f85b707bc10ba26e62033e2afd696e075575b68dc6e31928"; urls = [ "https://api.github.com/repos/php-fig/log/zipball/fe5ea303b0887d5caefd3d431c3e61ad47037001" ]; }
    { name = "ralouphie_getallheaders-3.0.3.0"; filename = "ralouphie/getallheaders/ddc5f4c7ab3d868f5060717336a0d93475d53175.zip"; sha256 = "ef0165da5690da666ab4cb88bb4cec0d50372e3e7c922532c5795a3567b367af"; urls = [ "https://api.github.com/repos/ralouphie/getallheaders/zipball/120b605dfeb996808c31b6477290a714d356e822" ]; }
    { name = "stephank_composer-plugin-nixify-1.1.0.0"; filename = "stephank/composer-plugin-nixify/6b00aedf28221acbb64a87222a0eb819404901f2.zip"; sha256 = "ac7cc480698f8717fb9fce4077b81303d37fe6ab2b89c8547cd7f9451598ee1e"; urls = [ "https://api.github.com/repos/stephank/composer-plugin-nixify/zipball/d93c4348388d714d7d81b41e34ccb2ae9c2131c2" ]; }
    { name = "symfony_console-6.2.7.0"; filename = "symfony/console/4b31fc722b124023d43b41228edf64c5b700998c.zip"; sha256 = "8b5eeb33462e13d94295a579029161364403d2de5070883164ba228f5bf0e30c"; urls = [ "https://api.github.com/repos/symfony/console/zipball/cbad09eb8925b6ad4fb721c7a179344dc4a19d45" ]; }
    { name = "symfony_dependency-injection-6.2.7.0"; filename = "symfony/dependency-injection/903e5c6f1d77b22333a95c89f1cc197ac898d559.zip"; sha256 = "9b9df138cd833d1fd7a7e054e49d3a383377fed75f781b87c69b6a56c25eb8ec"; urls = [ "https://api.github.com/repos/symfony/dependency-injection/zipball/83369dd4ec84bba9673524d25b79dfbde9e6e84c" ]; }
    { name = "symfony_deprecation-contracts-3.2.1.0"; filename = "symfony/deprecation-contracts/0ad17dcb9e2d141fcd8d83b9aed652bedb45c5c1.zip"; sha256 = "b0b3aa7babdc42b7d8626ac4d329e078e552df0380cda0b7205915ca7c9beafc"; urls = [ "https://api.github.com/repos/symfony/deprecation-contracts/zipball/e2d1534420bd723d0ef5aec58a22c5fe60ce6f5e" ]; }
    { name = "symfony_error-handler-6.2.7.0"; filename = "symfony/error-handler/ecdf774076cd3d4cabc3948fab5f179d4299680e.zip"; sha256 = "762e3e13874befa3234307e40ee864dae0870b59092ffec2122dd3bdff4db5cf"; urls = [ "https://api.github.com/repos/symfony/error-handler/zipball/61e90f94eb014054000bc902257d2763fac09166" ]; }
    { name = "symfony_event-dispatcher-6.2.7.0"; filename = "symfony/event-dispatcher/9c847546e34810372730e65bde1431d8ca634850.zip"; sha256 = "b19a79340392712b8e4e41a1a033d60f3694b797ded877d6af635bab2386c208"; urls = [ "https://api.github.com/repos/symfony/event-dispatcher/zipball/404b307de426c1c488e5afad64403e5f145e82a5" ]; }
    { name = "symfony_event-dispatcher-contracts-3.2.1.0"; filename = "symfony/event-dispatcher-contracts/92a33df7204f89f966e21b4cd225cbe5c90c0dfa.zip"; sha256 = "dd10951006cd49f30b88cfc28b3d56c66afdcadb50eb68d390b1123705040f7b"; urls = [ "https://api.github.com/repos/symfony/event-dispatcher-contracts/zipball/0ad3b6f1e4e2da5690fefe075cd53a238646d8dd" ]; }
    { name = "symfony_http-foundation-6.2.7.0"; filename = "symfony/http-foundation/e53f64a699cd885a11318797bdb66b875b028762.zip"; sha256 = "858202fa7cbdcb8934dca8995a7dcf258792dd12763fa9c708e94ed5df44968f"; urls = [ "https://api.github.com/repos/symfony/http-foundation/zipball/5fc3038d4a594223f9ea42e4e985548f3fcc9a3b" ]; }
    { name = "symfony_http-kernel-6.2.7.0"; filename = "symfony/http-kernel/2cf8a314c77c99188affd5159a4d0f2835840ee4.zip"; sha256 = "0d932b557353ffb2e426196e14f4b4b9ec0adfe6a94fa660fa2b12ce26006791"; urls = [ "https://api.github.com/repos/symfony/http-kernel/zipball/ca0680ad1e2d678536cc20e0ae33f9e4e5d2becd" ]; }
    { name = "symfony_mime-6.2.7.0"; filename = "symfony/mime/785bf6d5b54ac01aa81d074ebc72ec2c2c0f51f3.zip"; sha256 = "35aefd894f61bf9623b6b0ff45cddffa77b791d2873de6948ff0124b12f1a6d0"; urls = [ "https://api.github.com/repos/symfony/mime/zipball/62e341f80699badb0ad70b31149c8df89a2d778e" ]; }
    { name = "symfony_polyfill-ctype-1.27.0.0"; filename = "symfony/polyfill-ctype/04e84c03a82a82c09eaa688b17b523570f9d14d2.zip"; sha256 = "66f212bc73088271dbbec1f3b1c3ba21171e4c5ab38676c4d151441f3e38db6f"; urls = [ "https://api.github.com/repos/symfony/polyfill-ctype/zipball/5bbc823adecdae860bb64756d639ecfec17b050a" ]; }
    { name = "symfony_polyfill-iconv-1.27.0.0"; filename = "symfony/polyfill-iconv/69e48eceddb28b2d5879869d36e2ca37c03b236a.zip"; sha256 = "099017cb34e1eb1d9c7ab60d5ff0919afb66520151a14c50cf65509147fbb6e2"; urls = [ "https://api.github.com/repos/symfony/polyfill-iconv/zipball/927013f3aac555983a5059aada98e1907d842695" ]; }
    { name = "symfony_polyfill-intl-grapheme-1.27.0.0"; filename = "symfony/polyfill-intl-grapheme/3e0defb9f075160deb0ea7188610275ee40a9b00.zip"; sha256 = "11c409622d2321bfdd2fd1efdbdeaaba95da5211256f6cfdb4e003d7bd7eda45"; urls = [ "https://api.github.com/repos/symfony/polyfill-intl-grapheme/zipball/511a08c03c1960e08a883f4cffcacd219b758354" ]; }
    { name = "symfony_polyfill-intl-idn-1.27.0.0"; filename = "symfony/polyfill-intl-idn/c8495253150c4daacaf90487f77a76fc7122c16b.zip"; sha256 = "b2ff6b6408861c6c8c486fcb3bd2109438d5d6ced9175250cfbef1e596665cc4"; urls = [ "https://api.github.com/repos/symfony/polyfill-intl-idn/zipball/639084e360537a19f9ee352433b84ce831f3d2da" ]; }
    { name = "symfony_polyfill-intl-normalizer-1.27.0.0"; filename = "symfony/polyfill-intl-normalizer/3282f96073427a186419bc5ae65aa6726d0f143b.zip"; sha256 = "22bf30d7b50aabe1846e3ffbc03011903e05f4208d3bb49b373c4e5fe09500b5"; urls = [ "https://api.github.com/repos/symfony/polyfill-intl-normalizer/zipball/19bd1e4fcd5b91116f14d8533c57831ed00571b6" ]; }
    { name = "symfony_polyfill-mbstring-1.27.0.0"; filename = "symfony/polyfill-mbstring/7061da8bfb2a98acfbdcaf076c3ba5f167d856cc.zip"; sha256 = "b112101451a1f76a0cb4edd6595a5733059fd2f7a4cd4d36052526602e26a8fa"; urls = [ "https://api.github.com/repos/symfony/polyfill-mbstring/zipball/8ad114f6b39e2c98a8b0e3bd907732c207c2b534" ]; }
    { name = "symfony_polyfill-php72-1.27.0.0"; filename = "symfony/polyfill-php72/3dc6f2e0efb0a915be032510852eb9fb9205577c.zip"; sha256 = "973b3eaa88a3e4d3287b336c4a3e057feca1f9f703f05abd234a07d2105c14c0"; urls = [ "https://api.github.com/repos/symfony/polyfill-php72/zipball/869329b1e9894268a8a61dabb69153029b7a8c97" ]; }
    { name = "symfony_process-6.2.7.0"; filename = "symfony/process/1328cf8bd9409e6299ec50f869b401ee75c2b487.zip"; sha256 = "67f601abb339f0955c3ed92c413dd6a893279f9c0c4736c11eae8a1c0d4ce999"; urls = [ "https://api.github.com/repos/symfony/process/zipball/680e8a2ea6b3f87aecc07a6a65a203ae573d1902" ]; }
    { name = "symfony_psr-http-message-bridge-2.1.4.0"; filename = "symfony/psr-http-message-bridge/045a3aeeeefbd28d72869e839c762a93023b8387.zip"; sha256 = "fc815c39d4b704c5f5ab1a2c4c4c08cd09fbf29f7bee1fe9ec8b7f21c75e43b0"; urls = [ "https://api.github.com/repos/symfony/psr-http-message-bridge/zipball/a125b93ef378c492e274f217874906fb9babdebb" ]; }
    { name = "symfony_routing-6.2.7.0"; filename = "symfony/routing/4b93cd407d4fb2c4b0cb163ef79c3435404e82f3.zip"; sha256 = "6364d462ee7cc7a07970c01be88a731441e4e42c737268bef183be48bf8c69cf"; urls = [ "https://api.github.com/repos/symfony/routing/zipball/fa643fa4c56de161f8bc8c0492a76a60140b50e4" ]; }
    { name = "symfony_serializer-6.2.7.0"; filename = "symfony/serializer/3ff50be69cb20667b62cf70eb0cd9b16515d320c.zip"; sha256 = "97690eff9eb5a4c83b3e1684df19aca7798352eaf923b7d24f0070d377cb6656"; urls = [ "https://api.github.com/repos/symfony/serializer/zipball/df9599873fdc2540e6f4291f49be4fcc167e9cbf" ]; }
    { name = "symfony_service-contracts-3.2.1.0"; filename = "symfony/service-contracts/26b6617366492295e3d8cb72bab759e675248be4.zip"; sha256 = "a368aa78fe67f0a13ec04de1e88c1984dac876eb8d07622e4a0a6d50f7ad643e"; urls = [ "https://api.github.com/repos/symfony/service-contracts/zipball/a8c9cedf55f314f3a186041d19537303766df09a" ]; }
    { name = "symfony_string-6.2.7.0"; filename = "symfony/string/3fc443fb14487b6f356b06f6ad63fa11781f8f80.zip"; sha256 = "1e9a593be29d86831820fc756ce3473c9d079621f91aea0285c1d5e2ccea7dcb"; urls = [ "https://api.github.com/repos/symfony/string/zipball/67b8c1eec78296b85dc1c7d9743830160218993d" ]; }
    { name = "symfony_translation-contracts-3.2.1.0"; filename = "symfony/translation-contracts/89e925751b8ec582b1a424a2973915a72e967c6a.zip"; sha256 = "9d225aff9bf96fb1b362e40fa2e981c53bd73564334df8db045f3047fe3c43db"; urls = [ "https://api.github.com/repos/symfony/translation-contracts/zipball/dfec258b9dd17a6b24420d464c43bffe347441c8" ]; }
    { name = "symfony_validator-6.2.7.0"; filename = "symfony/validator/04207e92e6b25af66c2a8ba64694ea6f697b631d.zip"; sha256 = "f85218b316701d81f11ac35c677b7996ed6a39f3d1f26faaaae893e377add4a2"; urls = [ "https://api.github.com/repos/symfony/validator/zipball/4b3bd0a9545bdf7ebc84f0a494c05219010bb403" ]; }
    { name = "symfony_var-dumper-6.2.7.0"; filename = "symfony/var-dumper/34dd6d996c64a9fdae3e7c8ea9b418124cf5ff73.zip"; sha256 = "fad4419976ea945f61081e8a6fbbab97a6e5c223dea4dd1290a42625000ee7d0"; urls = [ "https://api.github.com/repos/symfony/var-dumper/zipball/cf8d4ca1ddc1e3cc242375deb8fc23e54f5e2a1e" ]; }
    { name = "symfony_var-exporter-6.2.7.0"; filename = "symfony/var-exporter/51877eca53439331740c471097ae9e993a532af0.zip"; sha256 = "a622b2f6f25e5f04c30b68113dc37dcaa49c3f37aa09899850799d8c0de723f0"; urls = [ "https://api.github.com/repos/symfony/var-exporter/zipball/86062dd0103530e151588c8f60f5b85a139f1442" ]; }
    { name = "symfony_yaml-6.2.7.0"; filename = "symfony/yaml/3b0e928cb1ebd28fe913021c60b398bb00165d62.zip"; sha256 = "7819e18ade4015311d493bd566c9a53444fa6017aa5920dd44cfa3aab3bd5942"; urls = [ "https://api.github.com/repos/symfony/yaml/zipball/e8e6a1d59e050525f27a1f530aa9703423cb7f57" ]; }
    { name = "twig_twig-3.5.1.0"; filename = "twig/twig/fd13f2c3b830e4015228a69234750d5fc25dd379.zip"; sha256 = "2b51937cf768b2e505aa438e0ca487344e1c310550568839ec6e5bae56852b20"; urls = [ "https://api.github.com/repos/twigphp/Twig/zipball/a6e0510cc793912b451fd40ab983a1d28f611c15" ]; }
    { name = "chi-teck_drupal-code-generator-2.6.2.0"; filename = "chi-teck/drupal-code-generator/8c9e26e3cfae88011ba89884e93448c7547f96f7.zip"; sha256 = "2ecde0ede164ccc4fd2599b60545c60105ddc2d162a0bf321d138295bb336686"; urls = [ "https://api.github.com/repos/Chi-teck/drupal-code-generator/zipball/22ed1cc02dc47814e8239de577da541e9b9bd980" ]; }
    { name = "consolidation_annotated-command-4.8.1.0"; filename = "consolidation/annotated-command/845ecbca83e25c61525261afd1172cf77e7b2d8c.zip"; sha256 = "f9c82dad94036e364f1d95c774e320b4f2990a0510f91d5a483b5c453f3e8866"; urls = [ "https://api.github.com/repos/consolidation/annotated-command/zipball/8fefdcff0cdb61bc04e34323f626404d536786a5" ]; }
    { name = "consolidation_config-2.1.2.0"; filename = "consolidation/config/d40af334303f730efe47e500393db9434953adaa.zip"; sha256 = "a04523fbb13634060be2a2fc5bcb2d1013cfdb7972ff89959365b6fe29c0c676"; urls = [ "https://api.github.com/repos/consolidation/config/zipball/597f8d7fbeef801736250ec10c3e190569b1b0ae" ]; }
    { name = "consolidation_filter-via-dot-access-data-2.0.2.0"; filename = "consolidation/filter-via-dot-access-data/15ef8555f765e8d678402c3c43b858650e686713.zip"; sha256 = "9f69364525e38a67303fdd68d6b9ce0c2ab7e9818775091cb0c2d53179faa947"; urls = [ "https://api.github.com/repos/consolidation/filter-via-dot-access-data/zipball/cb2eeba41f8e2e3c61698a5cf70ef048ff6c9d5b" ]; }
    { name = "consolidation_log-3.0.0.0"; filename = "consolidation/log/7d186722458c9561dc8f9093913f82040d4982e9.zip"; sha256 = "28b48c6c1afa920b64e866446eb5ec45f3709938d85a8568c23340a9e398b4cd"; urls = [ "https://api.github.com/repos/consolidation/log/zipball/caaad9d70dae54eb49002666f000e3c607066878" ]; }
    { name = "consolidation_output-formatters-4.2.4.0"; filename = "consolidation/output-formatters/564532f7f6ad369e9fbf684e60feb8c26f2c05b6.zip"; sha256 = "71e2a3b87187f645cfa58c2fd648f87804c02e285ccb334f9968e2a59173e503"; urls = [ "https://api.github.com/repos/consolidation/output-formatters/zipball/b377db7e9435c50c4e019c26ec164b547e754ca0" ]; }
    { name = "consolidation_robo-4.0.3.0"; filename = "consolidation/robo/d640548a7648b5c50aed7ce7235eeab82d83aa32.zip"; sha256 = "caaffe590962e83d009e44e13017a0450642cbb054a31361cf1d1134122e0789"; urls = [ "https://api.github.com/repos/consolidation/robo/zipball/d655b79c8e916f9f9947df0ddc1040967ddc5a28" ]; }
    { name = "consolidation_self-update-2.1.0.0"; filename = "consolidation/self-update/f9c9d8db981119e89df8bfdea8aad92c6e7bded4.zip"; sha256 = "bc685082d9725df8899bed5bb52cfbc47814a257619d40bfd986a42df3c7276a"; urls = [ "https://api.github.com/repos/consolidation/self-update/zipball/714b09fdf0513f83292874bb12de0566066040c2" ]; }
    { name = "consolidation_site-alias-4.0.0.0"; filename = "consolidation/site-alias/f69965f37d4cb83aad03b52aa2b6259aa961c095.zip"; sha256 = "fb6589f30af5a07b4b2e4a2553a60ad96ec285e6426bb830020764e2ec11127d"; urls = [ "https://api.github.com/repos/consolidation/site-alias/zipball/103fbc9bad6bbadb1f7533454a8f070ddce18e13" ]; }
    { name = "consolidation_site-process-5.2.0.0"; filename = "consolidation/site-process/0d1cebf2da2e130c4ae25f48d51b071a8a122fda.zip"; sha256 = "13e048f1975881da521122b32207eb96fc32712ec1526c17029b7450eadfb34a"; urls = [ "https://api.github.com/repos/consolidation/site-process/zipball/6c44638d7af8a8b4abe12c3180701243f480539d" ]; }
    { name = "dflydev_dot-access-data-3.0.2.0"; filename = "dflydev/dot-access-data/5872417a18bbb69b106dc09a3b09c46b193e0110.zip"; sha256 = "b2ae92836d920d2a968b32acd80e1c39a1446c749ddae28dc806408c7096ebed"; urls = [ "https://api.github.com/repos/dflydev/dflydev-dot-access-data/zipball/f41715465d65213d644d3141a6a93081be5d3549" ]; }
    { name = "drush_drush-11.5.1.0"; filename = "drush/drush/2908eb92eaf719ae92e5e4a2ee6972c3fd5fa82f.zip"; sha256 = "8b717d7a24c495f93c2bad49e3d1ea896cff1556e376273296058a9b16d63b10"; urls = [ "https://api.github.com/repos/drush-ops/drush/zipball/3138f82baa3b0e29ac935893a444881a7332177d" ]; }
    { name = "enlightn_security-checker-1.10.0.0"; filename = "enlightn/security-checker/39883dd804c5092f3e59c3fa1603a1b3a7d880a3.zip"; sha256 = "50e0f576c1e9dcc77b3a41d5e390697b3e6767151aafb94f9154efe60dfb4597"; urls = [ "https://api.github.com/repos/enlightn/security-checker/zipball/196bacc76e7a72a63d0e1220926dbb190272db97" ]; }
    { name = "grasmash_expander-3.0.0.0"; filename = "grasmash/expander/4c24503906555a9efbca00f850bae0344b23d01a.zip"; sha256 = "bafa056101200d79b24f5115a4d2992026226f00d6e0bf5b047c856d96683318"; urls = [ "https://api.github.com/repos/grasmash/expander/zipball/bb1c1a2430957945cf08c5a62f5d72a6aa6a2c82" ]; }
    { name = "league_container-4.2.0.0"; filename = "league/container/1b241684a1d0db9a1be6c0e7799461719b01c4b6.zip"; sha256 = "90d95326e92c15dd52c8274cb6690dc381557a9cd7e0afd65587a7e3b8fda475"; urls = [ "https://api.github.com/repos/thephpleague/container/zipball/375d13cb828649599ef5d48a339c4af7a26cd0ab" ]; }
    { name = "nikic_php-parser-4.15.4.0"; filename = "nikic/php-parser/86e6cda6df757a1ae3319ccb766d40a1a5f76e23.zip"; sha256 = "363dddb94fba2fd8aee140fdc1b01241ee01638cb977abcb46a2272b2b47eae0"; urls = [ "https://api.github.com/repos/nikic/PHP-Parser/zipball/6bb5176bc4af8bcb7d926f88718db9b96a2d4290" ]; }
    { name = "phootwork_collection-3.2.1.0"; filename = "phootwork/collection/93c9a130f4109a35056253841bd27a20c8ebd21c.zip"; sha256 = "401fb282a4ded305750b850a54fe73c041c7874efeb8541fee6b9366218ab121"; urls = [ "https://api.github.com/repos/phootwork/collection/zipball/46dde20420fba17766c89200bc3ff91d3e58eafa" ]; }
    { name = "phootwork_lang-3.2.1.0"; filename = "phootwork/lang/5023fe5e5d6b139b495f1ba0ab728dcf0beda2da.zip"; sha256 = "7c5e3f0ecd5edb74b0fef4e3bea8fcabb1d209cd136a443c3d545e1c8f953ecf"; urls = [ "https://api.github.com/repos/phootwork/lang/zipball/f6687cb0e5453ceb7b4a2c4f9fa81273758eedd0" ]; }
    { name = "phpowermove_docblock-4.0.0.0"; filename = "phpowermove/docblock/44fad93eac82c120c4c4a5ae647f98697b001c24.zip"; sha256 = "71c82e74a8db99940b249d39884f72f3b9415c0d3e5f1920b233f8c638ce9e8a"; urls = [ "https://api.github.com/repos/phpowermove/docblock/zipball/a73f6e17b7d4e1b92ca5378c248c952c9fae7826" ]; }
    { name = "psy_psysh-0.11.12.0"; filename = "psy/psysh/1da33c5576663102ff368350b12e4ad38017a91c.zip"; sha256 = "0674f39a530ec91747523f86bf140469081ec0b45e54a644758f1eb8f0759c85"; urls = [ "https://api.github.com/repos/bobthecow/psysh/zipball/52cb7c47d403c31c0adc9bf7710fc355f93c20f7" ]; }
    { name = "symfony_filesystem-6.2.7.0"; filename = "symfony/filesystem/1fbf8d3b3341a0a20e11f0dc9f1c92f8d27e3816.zip"; sha256 = "452d5a0546ead95b433bec7d5d60a8c6b9de954c6e8c1153197aa5b05828dca1"; urls = [ "https://api.github.com/repos/symfony/filesystem/zipball/82b6c62b959f642d000456f08c6d219d749215b3" ]; }
    { name = "symfony_finder-6.2.7.0"; filename = "symfony/finder/0f960a0a6648527376dfed8d16bf4b4833450054.zip"; sha256 = "08da08c31c82c1fdc73dbc215c5fca6003fb038a97f40980d8536a745d8b7e84"; urls = [ "https://api.github.com/repos/symfony/finder/zipball/20808dc6631aecafbe67c186af5dcb370be3a0eb" ]; }
    { name = "symfony_polyfill-php80-1.27.0.0"; filename = "symfony/polyfill-php80/fe4df98f0392f59ca247eec4d07f380451c09242.zip"; sha256 = "8db38ad9c85c94ad664b89ff9ec9dd5b232dc922f6107bb356d44e9dcf6cde9b"; urls = [ "https://api.github.com/repos/symfony/polyfill-php80/zipball/7a6ff3f1959bb01aefccb463a0f2cd3d3d2fd936" ]; }
    { name = "symfony_polyfill-php81-1.27.0.0"; filename = "symfony/polyfill-php81/05342953cef79782b0eb31a71035b4ad15818809.zip"; sha256 = "2e09d990064b80c605ac1d7b112895f0dc98e96a1e541e0215807c6bad931917"; urls = [ "https://api.github.com/repos/symfony/polyfill-php81/zipball/707403074c8ea6e2edaf8794b0157a0bfa52157a" ]; }
    { name = "webflo_drupal-finder-1.2.2.0"; filename = "webflo/drupal-finder/45d9563dca0d623d70cddeba9a8b90f29f0f516a.zip"; sha256 = "56837f299b36a222104347041607d934ba4a5fc1ddb18ad33d55da62642c1b4f"; urls = [ "https://api.github.com/repos/webflo/drupal-finder/zipball/c8e5dbe65caef285fec8057a4c718a0d4138d1ee" ]; }
  ];
  localPackages = [
  ];

  # Shell snippet to collect all project dependencies.
  collectCacheScript = writeText "collect-cache.sh" (
    concatMapStrings (args: ''
      (
        cacheFile=${escapeShellArg args.filename}
        cacheFilePath="$COMPOSER_CACHE_DIR/files/$cacheFile"
        mkdir -p "$(dirname "$cacheFilePath")"
        cp ${escapeShellArg (fetcher args)} "$cacheFilePath"
      )
    '') cacheEntries
  );

  replaceLocalPaths = writeText "replace-local-paths.sh" (
    concatMapStrings (args: ''
      sed -i -e "s|\"${args.string}\"|\"${args.path}\"|" composer.lock
    '') localPackages
  );

in stdenv.mkDerivation {
  name = "misterio77_drupal-nix-test";
  inherit src;

  # Make sure the build uses the right PHP version everywhere.
  # Also include unzip for Composer.
  buildInputs = [ php unzip ];

  # Defines the shell alias to run Composer.
  postHook = ''
    composer () {
      php "$NIX_COMPOSER_PATH" "$@"
    }
  '';

  configurePhase = ''
    runHook preConfigure

    # Set the cache directory for Composer.
    export COMPOSER_CACHE_DIR="$NIX_BUILD_TOP/.composer/cache"

    # Build the cache directory contents.
    source ${collectCacheScript}

    # Replace local package paths with their Nix store equivalent.
    source ${replaceLocalPaths}

    # Store the absolute path to Composer for the 'composer' alias.
    export NIX_COMPOSER_PATH="$(readlink -f ${escapeShellArg composerPath})"

    # Run normal Composer install to complete dependency installation.
    composer install

    runHook postConfigure
  '';

  buildPhase = ''
    runHook preBuild
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/libexec $out/bin

    # Move the entire project to the output directory.
    mv $PWD "$out/libexec/$sourceRoot"
    cd "$out/libexec/$sourceRoot"

    # Update the path to Composer.
    export NIX_COMPOSER_PATH="$(readlink -f ${escapeShellArg composerPath})"

    # Invoke a plugin internal command to setup binaries.
    composer nixify-install-bin "$out/bin"

    runHook postInstall
  '';

  passthru = {
    inherit php;
  };
}
