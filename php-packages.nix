{composerEnv, fetchurl, fetchgit ? null, fetchhg ? null, fetchsvn ? null, noDev ? false}:

let
  packages = {
    "asm89/stack-cors" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "asm89-stack-cors-73e5b88775c64ccc0b84fb60836b30dc9d92ac4a";
        src = fetchurl {
          url = "https://api.github.com/repos/asm89/stack-cors/zipball/73e5b88775c64ccc0b84fb60836b30dc9d92ac4a";
          sha256 = "1idpisw39ba2dic9jl2s2yrkdgbyny9dfxf0qdr5i0wfvvlmbdih";
        };
      };
    };
    "composer/installers" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "composer-installers-c29dc4b93137acb82734f672c37e029dfbd95b35";
        src = fetchurl {
          url = "https://api.github.com/repos/composer/installers/zipball/c29dc4b93137acb82734f672c37e029dfbd95b35";
          sha256 = "05d2dbfdlf5fbycl7gj6wr4c63dwlq3minm7fg2ampb2ynazc5cr";
        };
      };
    };
    "composer/semver" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "composer-semver-3953f23262f2bff1919fc82183ad9acb13ff62c9";
        src = fetchurl {
          url = "https://api.github.com/repos/composer/semver/zipball/3953f23262f2bff1919fc82183ad9acb13ff62c9";
          sha256 = "0sp54hzb2gq777rd0w5ciq00g0l85irc2m6s2zx7675g24wfbbms";
        };
      };
    };
    "doctrine/annotations" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "doctrine-annotations-648b0343343565c4a056bfc8392201385e8d89f0";
        src = fetchurl {
          url = "https://api.github.com/repos/doctrine/annotations/zipball/648b0343343565c4a056bfc8392201385e8d89f0";
          sha256 = "0mkxq1yaqp6an2gjcgsmg7hq37mrwcj27f94sfkfxq9x6qh02k57";
        };
      };
    };
    "doctrine/lexer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "doctrine-lexer-c268e882d4dbdd85e36e4ad69e02dc284f89d229";
        src = fetchurl {
          url = "https://api.github.com/repos/doctrine/lexer/zipball/c268e882d4dbdd85e36e4ad69e02dc284f89d229";
          sha256 = "12g069nljl3alyk15884nd1jc4mxk87isqsmfj7x6j2vxvk9qchs";
        };
      };
    };
    "drupal/core" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "drupal-core-d4051f23e51522703e3c26ecbc147449ba88eccc";
        src = fetchurl {
          url = "https://api.github.com/repos/drupal/core/zipball/d4051f23e51522703e3c26ecbc147449ba88eccc";
          sha256 = "03jjhyn110mrhaljmg07hlav04razcrgnfpdrp0jh1wp6ihhal1c";
        };
      };
    };
    "drupal/core-composer-scaffold" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "drupal-core-composer-scaffold-e3f17745ab88a919f5179e6d9c1ac8ce77d3845f";
        src = fetchurl {
          url = "https://api.github.com/repos/drupal/core-composer-scaffold/zipball/e3f17745ab88a919f5179e6d9c1ac8ce77d3845f";
          sha256 = "1ww92hdcb0lfrz3q0slp1k2k0y4l8wrypq9jx6zf6ibyvvq94f4f";
        };
      };
    };
    "drupal/core-recommended" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "drupal-core-recommended-88f1c7796f6f610a2cf7dffc354dd6f6abf2ccfb";
        src = fetchurl {
          url = "https://api.github.com/repos/drupal/core-recommended/zipball/88f1c7796f6f610a2cf7dffc354dd6f6abf2ccfb";
          sha256 = "1bwfwqvn61lqdygps7mr0i544ibb49mfgagz8gbnw54gygf7l9w8";
        };
      };
    };
    "egulias/email-validator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "egulias-email-validator-b531a2311709443320c786feb4519cfaf94af796";
        src = fetchurl {
          url = "https://api.github.com/repos/egulias/EmailValidator/zipball/b531a2311709443320c786feb4519cfaf94af796";
          sha256 = "0313ddp0n88py2jjsnm2slw4za58zlaqphq7lb4q0ppqipffnngc";
        };
      };
    };
    "guzzlehttp/guzzle" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "guzzlehttp-guzzle-b50a2a1251152e43f6a37f0fa053e730a67d25ba";
        src = fetchurl {
          url = "https://api.github.com/repos/guzzle/guzzle/zipball/b50a2a1251152e43f6a37f0fa053e730a67d25ba";
          sha256 = "0cy828r0kafx58jh0k1cy17y77qh248d9kfk9ncn9pyq2q5v9p9p";
        };
      };
    };
    "guzzlehttp/promises" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "guzzlehttp-promises-b94b2807d85443f9719887892882d0329d1e2598";
        src = fetchurl {
          url = "https://api.github.com/repos/guzzle/promises/zipball/b94b2807d85443f9719887892882d0329d1e2598";
          sha256 = "1vvac7y5ax955qjg7dyjmaw3vab9v2lypjygap0040rv3z4x9vz8";
        };
      };
    };
    "guzzlehttp/psr7" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "guzzlehttp-psr7-67c26b443f348a51926030c83481b85718457d3d";
        src = fetchurl {
          url = "https://api.github.com/repos/guzzle/psr7/zipball/67c26b443f348a51926030c83481b85718457d3d";
          sha256 = "09avh5xzmzwfpa5xv9zw90ypyfrhpyhszbli395prgh3llnrx9wg";
        };
      };
    };
    "masterminds/html5" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "masterminds-html5-897eb517a343a2281f11bc5556d6548db7d93947";
        src = fetchurl {
          url = "https://api.github.com/repos/Masterminds/html5-php/zipball/897eb517a343a2281f11bc5556d6548db7d93947";
          sha256 = "12fmcgsrmh0f0llnpcvk33mrs4067nw246ci5619rr79ijy3yc0k";
        };
      };
    };
    "pear/archive_tar" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "pear-archive_tar-4d761c5334c790e45ef3245f0864b8955c562caa";
        src = fetchurl {
          url = "https://api.github.com/repos/pear/Archive_Tar/zipball/4d761c5334c790e45ef3245f0864b8955c562caa";
          sha256 = "162pxgx3p3d68r9jsfh3a95xqcfg00kq81sigwvww4a7vw52nivj";
        };
      };
    };
    "pear/console_getopt" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "pear-console_getopt-a41f8d3e668987609178c7c4a9fe48fecac53fa0";
        src = fetchurl {
          url = "https://api.github.com/repos/pear/Console_Getopt/zipball/a41f8d3e668987609178c7c4a9fe48fecac53fa0";
          sha256 = "170nsads9k0p8301pgd6qsw4ar36jr9vh2slkpjj0kdw768dgvml";
        };
      };
    };
    "pear/pear-core-minimal" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "pear-pear-core-minimal-68d0d32ada737153b7e93b8d3c710ebe70ac867d";
        src = fetchurl {
          url = "https://api.github.com/repos/pear/pear-core-minimal/zipball/68d0d32ada737153b7e93b8d3c710ebe70ac867d";
          sha256 = "0gk1xj76k56sq1im6rggy5nbga4v7wm134casm678pw940x02f7q";
        };
      };
    };
    "pear/pear_exception" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "pear-pear_exception-b14fbe2ddb0b9f94f5b24cf08783d599f776fff0";
        src = fetchurl {
          url = "https://api.github.com/repos/pear/PEAR_Exception/zipball/b14fbe2ddb0b9f94f5b24cf08783d599f776fff0";
          sha256 = "0kgnwg1gw6k5wl1r0fjmrqmfk13n8hk2270g5cfhis0ak5qsfwb9";
        };
      };
    };
    "psr/cache" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-cache-aa5030cfa5405eccfdcb1083ce040c2cb8d253bf";
        src = fetchurl {
          url = "https://api.github.com/repos/php-fig/cache/zipball/aa5030cfa5405eccfdcb1083ce040c2cb8d253bf";
          sha256 = "07rnyjwb445sfj30v5ny3gfsgc1m7j7cyvwjgs2cm9slns1k1ml8";
        };
      };
    };
    "psr/container" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-container-c71ecc56dfe541dbd90c5360474fbc405f8d5963";
        src = fetchurl {
          url = "https://api.github.com/repos/php-fig/container/zipball/c71ecc56dfe541dbd90c5360474fbc405f8d5963";
          sha256 = "1mvan38yb65hwk68hl0p7jymwzr4zfnaxmwjbw7nj3rsknvga49i";
        };
      };
    };
    "psr/event-dispatcher" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-event-dispatcher-dbefd12671e8a14ec7f180cab83036ed26714bb0";
        src = fetchurl {
          url = "https://api.github.com/repos/php-fig/event-dispatcher/zipball/dbefd12671e8a14ec7f180cab83036ed26714bb0";
          sha256 = "05nicsd9lwl467bsv4sn44fjnnvqvzj1xqw2mmz9bac9zm66fsjd";
        };
      };
    };
    "psr/http-client" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-http-client-2dfb5f6c5eff0e91e20e913f8c5452ed95b86621";
        src = fetchurl {
          url = "https://api.github.com/repos/php-fig/http-client/zipball/2dfb5f6c5eff0e91e20e913f8c5452ed95b86621";
          sha256 = "0cmkifa3ji1r8kn3y1rwg81rh8g2crvnhbv2am6d688dzsbw967v";
        };
      };
    };
    "psr/http-factory" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-http-factory-12ac7fcd07e5b077433f5f2bee95b3a771bf61be";
        src = fetchurl {
          url = "https://api.github.com/repos/php-fig/http-factory/zipball/12ac7fcd07e5b077433f5f2bee95b3a771bf61be";
          sha256 = "0inbnqpc5bfhbbda9dwazsrw9xscfnc8rdx82q1qm3r446mc1vds";
        };
      };
    };
    "psr/http-message" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-http-message-f6561bf28d520154e4b0ec72be95418abe6d9363";
        src = fetchurl {
          url = "https://api.github.com/repos/php-fig/http-message/zipball/f6561bf28d520154e4b0ec72be95418abe6d9363";
          sha256 = "195dd67hva9bmr52iadr4kyp2gw2f5l51lplfiay2pv6l9y4cf45";
        };
      };
    };
    "psr/log" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psr-log-fe5ea303b0887d5caefd3d431c3e61ad47037001";
        src = fetchurl {
          url = "https://api.github.com/repos/php-fig/log/zipball/fe5ea303b0887d5caefd3d431c3e61ad47037001";
          sha256 = "0a0rwg38vdkmal3nwsgx58z06qkfl85w2yvhbgwg45anr0b3bhmv";
        };
      };
    };
    "ralouphie/getallheaders" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "ralouphie-getallheaders-120b605dfeb996808c31b6477290a714d356e822";
        src = fetchurl {
          url = "https://api.github.com/repos/ralouphie/getallheaders/zipball/120b605dfeb996808c31b6477290a714d356e822";
          sha256 = "1bv7ndkkankrqlr2b4kw7qp3fl0dxi6bp26bnim6dnlhavd6a0gg";
        };
      };
    };
    "symfony/console" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-console-cbad09eb8925b6ad4fb721c7a179344dc4a19d45";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/console/zipball/cbad09eb8925b6ad4fb721c7a179344dc4a19d45";
          sha256 = "0373y1dqy8mschqqhw2hvv906i1nc68h4yd5jm1dj4rf8qrynplb";
        };
      };
    };
    "symfony/dependency-injection" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-dependency-injection-83369dd4ec84bba9673524d25b79dfbde9e6e84c";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/dependency-injection/zipball/83369dd4ec84bba9673524d25b79dfbde9e6e84c";
          sha256 = "1v5qbv15cslvqs3iny2zszz7fcrq7afy8m70lzbiygc3rlwg37cv";
        };
      };
    };
    "symfony/deprecation-contracts" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-deprecation-contracts-e2d1534420bd723d0ef5aec58a22c5fe60ce6f5e";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/deprecation-contracts/zipball/e2d1534420bd723d0ef5aec58a22c5fe60ce6f5e";
          sha256 = "1z7akdycl5ar42vs1kc00ggm5rbqw0lx7i3acbcbfhnwmdxsmcxh";
        };
      };
    };
    "symfony/error-handler" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-error-handler-61e90f94eb014054000bc902257d2763fac09166";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/error-handler/zipball/61e90f94eb014054000bc902257d2763fac09166";
          sha256 = "1kxm9pzvvlrd2b1gwbq9b45qgq6sckl0xr078cis7vsbhw9kwbkn";
        };
      };
    };
    "symfony/event-dispatcher" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-event-dispatcher-404b307de426c1c488e5afad64403e5f145e82a5";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/event-dispatcher/zipball/404b307de426c1c488e5afad64403e5f145e82a5";
          sha256 = "0262hqisnnv3mzb7gn6yjyvr8dhgsqrs18a19s72nwcj0cs7k6mi";
        };
      };
    };
    "symfony/event-dispatcher-contracts" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-event-dispatcher-contracts-0ad3b6f1e4e2da5690fefe075cd53a238646d8dd";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/event-dispatcher-contracts/zipball/0ad3b6f1e4e2da5690fefe075cd53a238646d8dd";
          sha256 = "0yqg0h2kf4mij39nisshvg5gssn6aqyqphngi05z6jfd0q89a46x";
        };
      };
    };
    "symfony/http-foundation" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-http-foundation-5fc3038d4a594223f9ea42e4e985548f3fcc9a3b";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/http-foundation/zipball/5fc3038d4a594223f9ea42e4e985548f3fcc9a3b";
          sha256 = "13wn8kgxakp9133sjgvn2bfr51r5rxymm6d8vhs8kjxxgkx050l5";
        };
      };
    };
    "symfony/http-kernel" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-http-kernel-ca0680ad1e2d678536cc20e0ae33f9e4e5d2becd";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/http-kernel/zipball/ca0680ad1e2d678536cc20e0ae33f9e4e5d2becd";
          sha256 = "14b700kcw4ibz9hackx9wvghmv5rnks18vhr4vjb5zskfdajp4qd";
        };
      };
    };
    "symfony/mime" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-mime-62e341f80699badb0ad70b31149c8df89a2d778e";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/mime/zipball/62e341f80699badb0ad70b31149c8df89a2d778e";
          sha256 = "1l56y494n4phiyafcgc7sa8vfxzsvz6lbzxhnqirdgv19y4zvbim";
        };
      };
    };
    "symfony/polyfill-ctype" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-ctype-5bbc823adecdae860bb64756d639ecfec17b050a";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-ctype/zipball/5bbc823adecdae860bb64756d639ecfec17b050a";
          sha256 = "0vyv70z1yi2is727d1mkb961w5r1pb1v3wy1pvdp30h8ffy15wk6";
        };
      };
    };
    "symfony/polyfill-iconv" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-iconv-927013f3aac555983a5059aada98e1907d842695";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-iconv/zipball/927013f3aac555983a5059aada98e1907d842695";
          sha256 = "1qmnzd3r2l35rx84r8ai0596dywsj7q5y3dngaf1vsz16k5ig409";
        };
      };
    };
    "symfony/polyfill-intl-grapheme" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-intl-grapheme-511a08c03c1960e08a883f4cffcacd219b758354";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-intl-grapheme/zipball/511a08c03c1960e08a883f4cffcacd219b758354";
          sha256 = "0ifsgsyxf0z0nkynqvr5259dm5dsmbgdpvyi5zfvy8935mi0ki0i";
        };
      };
    };
    "symfony/polyfill-intl-idn" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-intl-idn-639084e360537a19f9ee352433b84ce831f3d2da";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-intl-idn/zipball/639084e360537a19f9ee352433b84ce831f3d2da";
          sha256 = "1i2wcsbfbwdyrx8545yrrvbdaf4l2393pjvg9266q74611j6pzxj";
        };
      };
    };
    "symfony/polyfill-intl-normalizer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-intl-normalizer-19bd1e4fcd5b91116f14d8533c57831ed00571b6";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-intl-normalizer/zipball/19bd1e4fcd5b91116f14d8533c57831ed00571b6";
          sha256 = "1d80jph5ykiw6ydv8fwd43s0aglh24qc1yrzds2f3aqanpbk1gr2";
        };
      };
    };
    "symfony/polyfill-mbstring" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-mbstring-8ad114f6b39e2c98a8b0e3bd907732c207c2b534";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-mbstring/zipball/8ad114f6b39e2c98a8b0e3bd907732c207c2b534";
          sha256 = "1ym84qp609i50lv4vkd4yz99y19kaxd5kmpdnh66mxx1a4a104mi";
        };
      };
    };
    "symfony/polyfill-php72" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-php72-869329b1e9894268a8a61dabb69153029b7a8c97";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-php72/zipball/869329b1e9894268a8a61dabb69153029b7a8c97";
          sha256 = "1h0lbh8d41sa4fymmw03yzws3v3z0lz4lv1kgcld7r53i2m3wfwp";
        };
      };
    };
    "symfony/process" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-process-680e8a2ea6b3f87aecc07a6a65a203ae573d1902";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/process/zipball/680e8a2ea6b3f87aecc07a6a65a203ae573d1902";
          sha256 = "16g99h6ir2mf3v0kciqckjgjg4x8sqyl2b6r7rf9bw1rnfmh3xk7";
        };
      };
    };
    "symfony/psr-http-message-bridge" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-psr-http-message-bridge-a125b93ef378c492e274f217874906fb9babdebb";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/psr-http-message-bridge/zipball/a125b93ef378c492e274f217874906fb9babdebb";
          sha256 = "1c23bv3j2zwbxklizvkvkzrgn2fd1164qb0smgswa15pshwmr0gw";
        };
      };
    };
    "symfony/routing" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-routing-fa643fa4c56de161f8bc8c0492a76a60140b50e4";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/routing/zipball/fa643fa4c56de161f8bc8c0492a76a60140b50e4";
          sha256 = "1kv9ijzligl3y6z6hwkk5kjf8h8lff5fh6y0f1ws1ivwxrid8r33";
        };
      };
    };
    "symfony/serializer" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-serializer-df9599873fdc2540e6f4291f49be4fcc167e9cbf";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/serializer/zipball/df9599873fdc2540e6f4291f49be4fcc167e9cbf";
          sha256 = "0mk6rdvx6w009z9bf8zrx9986yd7mhcxz10n7qxwi95mkvzhwscp";
        };
      };
    };
    "symfony/service-contracts" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-service-contracts-a8c9cedf55f314f3a186041d19537303766df09a";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/service-contracts/zipball/a8c9cedf55f314f3a186041d19537303766df09a";
          sha256 = "0gk4mpvm0v8a98p641wdxdvcinl4366fiqadq0za3w37zrwals53";
        };
      };
    };
    "symfony/string" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-string-67b8c1eec78296b85dc1c7d9743830160218993d";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/string/zipball/67b8c1eec78296b85dc1c7d9743830160218993d";
          sha256 = "1jvxxb6f5mf1hl1fl6pr46b0g79w8zinqxgw40c871lxw8xmk6hy";
        };
      };
    };
    "symfony/translation-contracts" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-translation-contracts-dfec258b9dd17a6b24420d464c43bffe347441c8";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/translation-contracts/zipball/dfec258b9dd17a6b24420d464c43bffe347441c8";
          sha256 = "1ns37kz4fc2z0kdzhk9kchsxffy5h7ls43z4carv2vzrkgzml8lx";
        };
      };
    };
    "symfony/validator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-validator-4b3bd0a9545bdf7ebc84f0a494c05219010bb403";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/validator/zipball/4b3bd0a9545bdf7ebc84f0a494c05219010bb403";
          sha256 = "18nlmmvy74z8mam6zwniycwnmvcng5xnfp633bqq27bh2srihlpq";
        };
      };
    };
    "symfony/var-dumper" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-var-dumper-cf8d4ca1ddc1e3cc242375deb8fc23e54f5e2a1e";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/var-dumper/zipball/cf8d4ca1ddc1e3cc242375deb8fc23e54f5e2a1e";
          sha256 = "1l771q02a9m4j09dv96y4g1fb9lpmfxnz2hy11hmz57afscl3m7s";
        };
      };
    };
    "symfony/var-exporter" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-var-exporter-86062dd0103530e151588c8f60f5b85a139f1442";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/var-exporter/zipball/86062dd0103530e151588c8f60f5b85a139f1442";
          sha256 = "1w13ww6qr7bra2c8j2da6wzrr96agp1ks4b81g1h8psyybvb48m6";
        };
      };
    };
    "symfony/yaml" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-yaml-e8e6a1d59e050525f27a1f530aa9703423cb7f57";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/yaml/zipball/e8e6a1d59e050525f27a1f530aa9703423cb7f57";
          sha256 = "0hjrpnrsm8yg8kfj0nda2xhgli1llp4ndm9v94fk25a0vs5f26bq";
        };
      };
    };
    "twig/twig" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "twig-twig-a6e0510cc793912b451fd40ab983a1d28f611c15";
        src = fetchurl {
          url = "https://api.github.com/repos/twigphp/Twig/zipball/a6e0510cc793912b451fd40ab983a1d28f611c15";
          sha256 = "081bhmbawnvfxhwqhmjh0lqiqkilhyj0r3j3m82ybck8yxy96l9b";
        };
      };
    };
  };
  devPackages = {
    "chi-teck/drupal-code-generator" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "chi-teck-drupal-code-generator-22ed1cc02dc47814e8239de577da541e9b9bd980";
        src = fetchurl {
          url = "https://api.github.com/repos/Chi-teck/drupal-code-generator/zipball/22ed1cc02dc47814e8239de577da541e9b9bd980";
          sha256 = "11k66fxrb0hk3lrbz832s71ds181qr2hbdlr4pyw9k34w7ny1k9f";
        };
      };
    };
    "consolidation/annotated-command" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "consolidation-annotated-command-8fefdcff0cdb61bc04e34323f626404d536786a5";
        src = fetchurl {
          url = "https://api.github.com/repos/consolidation/annotated-command/zipball/8fefdcff0cdb61bc04e34323f626404d536786a5";
          sha256 = "0rl87qzlap1v91d1vy8h0l59kwml43ip9iwm3m7kcvh3jjnjvj7r";
        };
      };
    };
    "consolidation/config" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "consolidation-config-597f8d7fbeef801736250ec10c3e190569b1b0ae";
        src = fetchurl {
          url = "https://api.github.com/repos/consolidation/config/zipball/597f8d7fbeef801736250ec10c3e190569b1b0ae";
          sha256 = "0xn6q0lzxdk5jfaqkzvjg7dwy4qh5p5mpz52w85hcd1nn7xj6id0";
        };
      };
    };
    "consolidation/filter-via-dot-access-data" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "consolidation-filter-via-dot-access-data-cb2eeba41f8e2e3c61698a5cf70ef048ff6c9d5b";
        src = fetchurl {
          url = "https://api.github.com/repos/consolidation/filter-via-dot-access-data/zipball/cb2eeba41f8e2e3c61698a5cf70ef048ff6c9d5b";
          sha256 = "0ix9z9wk3mf2n0f0jxc7h7lvfahcrswxcs6x7wq6g2p34m2kcscz";
        };
      };
    };
    "consolidation/log" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "consolidation-log-caaad9d70dae54eb49002666f000e3c607066878";
        src = fetchurl {
          url = "https://api.github.com/repos/consolidation/log/zipball/caaad9d70dae54eb49002666f000e3c607066878";
          sha256 = "1kdlk3isjh1kq9l8annq72cp1ws5xjsnwi36x1j0p4ps39n8rd18";
        };
      };
    };
    "consolidation/output-formatters" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "consolidation-output-formatters-b377db7e9435c50c4e019c26ec164b547e754ca0";
        src = fetchurl {
          url = "https://api.github.com/repos/consolidation/output-formatters/zipball/b377db7e9435c50c4e019c26ec164b547e754ca0";
          sha256 = "00z5ff8sbqk8k57k7jsw50pc013qz14dcbwclp7lbxl7f6wa7qki";
        };
      };
    };
    "consolidation/robo" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "consolidation-robo-d655b79c8e916f9f9947df0ddc1040967ddc5a28";
        src = fetchurl {
          url = "https://api.github.com/repos/consolidation/robo/zipball/d655b79c8e916f9f9947df0ddc1040967ddc5a28";
          sha256 = "12875q93848xrxhi78sln35l41j5l0bk1qa4kq03vs3215czxbya";
        };
      };
    };
    "consolidation/self-update" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "consolidation-self-update-714b09fdf0513f83292874bb12de0566066040c2";
        src = fetchurl {
          url = "https://api.github.com/repos/consolidation/self-update/zipball/714b09fdf0513f83292874bb12de0566066040c2";
          sha256 = "0si7qzrjv946v6zl17b1ayi18y64zcnbanzdkf4zhpbjv6150s5w";
        };
      };
    };
    "consolidation/site-alias" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "consolidation-site-alias-103fbc9bad6bbadb1f7533454a8f070ddce18e13";
        src = fetchurl {
          url = "https://api.github.com/repos/consolidation/site-alias/zipball/103fbc9bad6bbadb1f7533454a8f070ddce18e13";
          sha256 = "0z8j27nf4r0708qbhss2ws2w4vnr1ak569aa5r5pp87m1brqjrgv";
        };
      };
    };
    "consolidation/site-process" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "consolidation-site-process-6c44638d7af8a8b4abe12c3180701243f480539d";
        src = fetchurl {
          url = "https://api.github.com/repos/consolidation/site-process/zipball/6c44638d7af8a8b4abe12c3180701243f480539d";
          sha256 = "0jmkvzm50x4v08bnqln15rqk5z4nxc3j5cr2259dm0aqjzqliq0k";
        };
      };
    };
    "dflydev/dot-access-data" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "dflydev-dot-access-data-f41715465d65213d644d3141a6a93081be5d3549";
        src = fetchurl {
          url = "https://api.github.com/repos/dflydev/dflydev-dot-access-data/zipball/f41715465d65213d644d3141a6a93081be5d3549";
          sha256 = "1vgbjrq8qh06r26y5nlxfin4989r3h7dib1jifb2l3cjdn1r5bmj";
        };
      };
    };
    "drush/drush" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "drush-drush-3138f82baa3b0e29ac935893a444881a7332177d";
        src = fetchurl {
          url = "https://api.github.com/repos/drush-ops/drush/zipball/3138f82baa3b0e29ac935893a444881a7332177d";
          sha256 = "041vsqb9p2h5jqr2fxp3aqazyv49xb8y6jdd5cygk5f44ix7swcb";
        };
      };
    };
    "enlightn/security-checker" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "enlightn-security-checker-196bacc76e7a72a63d0e1220926dbb190272db97";
        src = fetchurl {
          url = "https://api.github.com/repos/enlightn/security-checker/zipball/196bacc76e7a72a63d0e1220926dbb190272db97";
          sha256 = "15s5zc6ydvslj57vkbqs2mknfgkvd68f7ma179xwgp79q5vgbq2h";
        };
      };
    };
    "grasmash/expander" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "grasmash-expander-bb1c1a2430957945cf08c5a62f5d72a6aa6a2c82";
        src = fetchurl {
          url = "https://api.github.com/repos/grasmash/expander/zipball/bb1c1a2430957945cf08c5a62f5d72a6aa6a2c82";
          sha256 = "061kd2b6v1bw0idvzq6n01pj49i0k79a85ai9yr7j39005hhbyms";
        };
      };
    };
    "league/container" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "league-container-375d13cb828649599ef5d48a339c4af7a26cd0ab";
        src = fetchurl {
          url = "https://api.github.com/repos/thephpleague/container/zipball/375d13cb828649599ef5d48a339c4af7a26cd0ab";
          sha256 = "0xd4znwf79w7apbazq6pkix5b0f31mlvck17r19ds59cx4k57nch";
        };
      };
    };
    "nikic/php-parser" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "nikic-php-parser-6bb5176bc4af8bcb7d926f88718db9b96a2d4290";
        src = fetchurl {
          url = "https://api.github.com/repos/nikic/PHP-Parser/zipball/6bb5176bc4af8bcb7d926f88718db9b96a2d4290";
          sha256 = "1q7a8wmjn9x28v5snxxriiih3vj12aqc3za0w6pdhbxs9ywxsg9n";
        };
      };
    };
    "phootwork/collection" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phootwork-collection-46dde20420fba17766c89200bc3ff91d3e58eafa";
        src = fetchurl {
          url = "https://api.github.com/repos/phootwork/collection/zipball/46dde20420fba17766c89200bc3ff91d3e58eafa";
          sha256 = "08dii8hnd4vbxqgm9f7y9s3wfhf0fgz582l51dshblyylj1b47s0";
        };
      };
    };
    "phootwork/lang" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phootwork-lang-f6687cb0e5453ceb7b4a2c4f9fa81273758eedd0";
        src = fetchurl {
          url = "https://api.github.com/repos/phootwork/lang/zipball/f6687cb0e5453ceb7b4a2c4f9fa81273758eedd0";
          sha256 = "1kryjn7iqpjl7ly48shkrl4x5cdbzjlbxqzlzsq79nsyrl73ypkw";
        };
      };
    };
    "phpowermove/docblock" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "phpowermove-docblock-a73f6e17b7d4e1b92ca5378c248c952c9fae7826";
        src = fetchurl {
          url = "https://api.github.com/repos/phpowermove/docblock/zipball/a73f6e17b7d4e1b92ca5378c248c952c9fae7826";
          sha256 = "12lyrqwcdy1kn8h1jpry1mf43fgkf97qhfcx4h5r96fvm1s2xj3i";
        };
      };
    };
    "psy/psysh" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "psy-psysh-52cb7c47d403c31c0adc9bf7710fc355f93c20f7";
        src = fetchurl {
          url = "https://api.github.com/repos/bobthecow/psysh/zipball/52cb7c47d403c31c0adc9bf7710fc355f93c20f7";
          sha256 = "11cwfpqbh7lgfm2acm2ynk01w2390habz1iza93igj8fafdg6x06";
        };
      };
    };
    "symfony/filesystem" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-filesystem-82b6c62b959f642d000456f08c6d219d749215b3";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/filesystem/zipball/82b6c62b959f642d000456f08c6d219d749215b3";
          sha256 = "18fw51cb19bs359i333f9jaxxff6m1h5szgc7d1mpnga8q2mlba5";
        };
      };
    };
    "symfony/finder" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-finder-20808dc6631aecafbe67c186af5dcb370be3a0eb";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/finder/zipball/20808dc6631aecafbe67c186af5dcb370be3a0eb";
          sha256 = "113yidfp8sjkv200kx4pi81zn0v0r9gmq8dw7p3zvhc23k1hinh8";
        };
      };
    };
    "symfony/polyfill-php80" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-php80-7a6ff3f1959bb01aefccb463a0f2cd3d3d2fd936";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-php80/zipball/7a6ff3f1959bb01aefccb463a0f2cd3d3d2fd936";
          sha256 = "16yydk7rsknlasrpn47n4b4js8svvp4rxzw99dkav52wr3cqmcwd";
        };
      };
    };
    "symfony/polyfill-php81" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "symfony-polyfill-php81-707403074c8ea6e2edaf8794b0157a0bfa52157a";
        src = fetchurl {
          url = "https://api.github.com/repos/symfony/polyfill-php81/zipball/707403074c8ea6e2edaf8794b0157a0bfa52157a";
          sha256 = "05qrjfnnnz402l11wm0ydblrip7hjll12yqxmh2wd02b0s8dj29f";
        };
      };
    };
    "webflo/drupal-finder" = {
      targetDir = "";
      src = composerEnv.buildZipPackage {
        name = "webflo-drupal-finder-c8e5dbe65caef285fec8057a4c718a0d4138d1ee";
        src = fetchurl {
          url = "https://api.github.com/repos/webflo/drupal-finder/zipball/c8e5dbe65caef285fec8057a4c718a0d4138d1ee";
          sha256 = "0kqv5ij65njm7p9qmcfxq5glmfilv43ic1278c8258inkclpz0sn";
        };
      };
    };
  };
in
composerEnv.buildPackage {
  inherit packages devPackages noDev;
  name = "misterio77-drupal-nix-test";
  src = composerEnv.filterSrc ./.;
  executable = false;
  symlinkDependencies = false;
  meta = {};
}
