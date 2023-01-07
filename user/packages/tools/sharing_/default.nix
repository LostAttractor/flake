{pkgs ? import <nixpkgs> { inherit system; }, 
  system ? builtins.currentSystem, nodejs ? pkgs."nodejs-18_x",
  fetchurl,
  fetchgit,
  fetchFromGitHub,
  globalBuildInputs ? []
}:

let
  nodeEnv = import ./node-env.nix {
    inherit (pkgs) stdenv lib python2 runCommand writeTextFile writeShellScript;
    inherit pkgs nodejs;
    libtool = if pkgs.stdenv.isDarwin then pkgs.darwin.cctools else null;
  };

  sources = {
    "accepts-1.3.8" = {
      name = "accepts";
      packageName = "accepts";
      version = "1.3.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/accepts/-/accepts-1.3.8.tgz";
        sha512 = "PYAthTa2m2VKxuvSD3DPC/Gy+U+sOA1LAuT8mkmRuvw+NACSaeXEQ+NHcVF7rONl6qcaxV3Uuemwawk+7+SJLw==";
      };
    };
    "ansi-regex-5.0.1" = {
      name = "ansi-regex";
      packageName = "ansi-regex";
      version = "5.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/ansi-regex/-/ansi-regex-5.0.1.tgz";
        sha512 = "quJQXlTSUGL2LH9SUXo8VwsY4soanhgo6LNSm84E1LBcE8s3O0wpdiRzyR9z/ZZJMlMWv37qOOb9pdJlMUEKFQ==";
      };
    };
    "ansi-styles-4.3.0" = {
      name = "ansi-styles";
      packageName = "ansi-styles";
      version = "4.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/ansi-styles/-/ansi-styles-4.3.0.tgz";
        sha512 = "zbB9rCJAT1rbjiVDb2hqKFHNYLxgtk8NURxZ3IZwD3F6NtxbXZQCnnSi1Lkx+IDohdPlFp222wVALIheZJQSEg==";
      };
    };
    "arch-2.2.0" = {
      name = "arch";
      packageName = "arch";
      version = "2.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/arch/-/arch-2.2.0.tgz";
        sha512 = "Of/R0wqp83cgHozfIYLbBMnej79U/SVGOOyuB3VVFv1NRM/PSFMK12x9KVtiYzJqmnU5WR2qp0Z5rHb7sWGnFQ==";
      };
    };
    "array-flatten-1.1.1" = {
      name = "array-flatten";
      packageName = "array-flatten";
      version = "1.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/array-flatten/-/array-flatten-1.1.1.tgz";
        sha512 = "PCVAQswWemu6UdxsDFFX/+gVeYqKAod3D3UVm91jHwynguOwAvYPhx8nNlM++NqRcK6CxxpUafjmhIdKiHibqg==";
      };
    };
    "async-2.6.4" = {
      name = "async";
      packageName = "async";
      version = "2.6.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/async/-/async-2.6.4.tgz";
        sha512 = "mzo5dfJYwAn29PeiJ0zvwTo04zj8HDJj0Mn8TD7sno7q12prdbnasKJHhkm2c1LgrhlJ0teaea8860oxi51mGA==";
      };
    };
    "balanced-match-1.0.2" = {
      name = "balanced-match";
      packageName = "balanced-match";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.2.tgz";
        sha512 = "3oSeUO0TMV67hN1AmbXsK4yaqU7tjiHlbxRDZOpH0KW9+CeX4bRAaX0Anxt0tx2MrpRpWwQaPwIlISEJhYU5Pw==";
      };
    };
    "basic-auth-2.0.1" = {
      name = "basic-auth";
      packageName = "basic-auth";
      version = "2.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/basic-auth/-/basic-auth-2.0.1.tgz";
        sha512 = "NF+epuEdnUYVlGuhaxbbq+dvJttwLnGY+YixlXlME5KpQ5W3CnXA5cVTneY3SPbPDRkcjMbifrwmFYcClgOZeg==";
      };
    };
    "body-parser-1.20.1" = {
      name = "body-parser";
      packageName = "body-parser";
      version = "1.20.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/body-parser/-/body-parser-1.20.1.tgz";
        sha512 = "jWi7abTbYwajOytWCQc37VulmWiRae5RyTpaCyDcS5/lMdtwSz5lOpDE67srw/HYe35f1z3fDQw+3txg7gNtWw==";
      };
    };
    "brace-expansion-1.1.11" = {
      name = "brace-expansion";
      packageName = "brace-expansion";
      version = "1.1.11";
      src = fetchurl {
        url = "https://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.11.tgz";
        sha512 = "iCuPHDFgrHX7H2vEI/5xpz07zSHB00TpugqhmYtVmMO6518mCuRMoOYFldEBl0g187ufozdaHgWKcYFb61qGiA==";
      };
    };
    "busboy-1.6.0" = {
      name = "busboy";
      packageName = "busboy";
      version = "1.6.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/busboy/-/busboy-1.6.0.tgz";
        sha512 = "8SFQbg/0hQ9xy3UNTB0YEnsNBbWfhf7RtnzpL7TkBiTBRfrQ9Fxcnz7VJsleJpyp6rVLvXiuORqjlHi5q+PYuA==";
      };
    };
    "bytes-3.0.0" = {
      name = "bytes";
      packageName = "bytes";
      version = "3.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/bytes/-/bytes-3.0.0.tgz";
        sha512 = "pMhOfFDPiv9t5jjIXkHosWmkSyQbvsgEVNkz0ERHbuLh2T/7j4Mqqpz523Fe8MVY89KC6Sh/QfS2sM+SjgFDcw==";
      };
    };
    "bytes-3.1.2" = {
      name = "bytes";
      packageName = "bytes";
      version = "3.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/bytes/-/bytes-3.1.2.tgz";
        sha512 = "/Nf7TyzTx6S3yRJObOAV7956r8cr2+Oj8AC5dt8wSP3BQAoeX58NoHyCU8P8zGkNXStjTSi6fzO6F0pBdcYbEg==";
      };
    };
    "call-bind-1.0.2" = {
      name = "call-bind";
      packageName = "call-bind";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/call-bind/-/call-bind-1.0.2.tgz";
        sha512 = "7O+FbCihrB5WGbFYesctwmTKae6rOiIzmz1icreWJ+0aA7LJfuqhEso2T9ncpcFtzMQtzXf2QGGueWJGTYsqrA==";
      };
    };
    "clipboardy-3.0.0" = {
      name = "clipboardy";
      packageName = "clipboardy";
      version = "3.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/clipboardy/-/clipboardy-3.0.0.tgz";
        sha512 = "Su+uU5sr1jkUy1sGRpLKjKrvEOVXgSgiSInwa/qeID6aJ07yh+5NWc3h2QfjHjBnfX4LhtFcuAWKUsJ3r+fjbg==";
      };
    };
    "cliui-8.0.1" = {
      name = "cliui";
      packageName = "cliui";
      version = "8.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/cliui/-/cliui-8.0.1.tgz";
        sha512 = "BSeNnyus75C4//NQ9gQt1/csTXyo/8Sb+afLAkzAptFuMsod9HFokGNudZpi/oQV73hnVK+sR+5PVRMd+Dr7YQ==";
      };
    };
    "color-convert-2.0.1" = {
      name = "color-convert";
      packageName = "color-convert";
      version = "2.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/color-convert/-/color-convert-2.0.1.tgz";
        sha512 = "RRECPsj7iu/xb5oKYcsFHSppFNnsj/52OVTRKb4zP5onXwVF3zVmmToNcOfGC+CRDpfK/U584fMg38ZHCaElKQ==";
      };
    };
    "color-name-1.1.4" = {
      name = "color-name";
      packageName = "color-name";
      version = "1.1.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/color-name/-/color-name-1.1.4.tgz";
        sha512 = "dOy+3AuW3a2wNbZHIuMZpTcgjGuLU/uBL/ubcZF9OXbDo8ff4O8yVp5Bf0efS8uEoYo5q4Fx7dY9OgQGXgAsQA==";
      };
    };
    "concat-map-0.0.1" = {
      name = "concat-map";
      packageName = "concat-map";
      version = "0.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz";
        sha512 = "/Srv4dswyQNBfohGpz9o6Yb3Gz3SrUDqBH5rTuhGR7ahtlbYKnVxw2bCFMRljaA7EXHaXZ8wsHdodFvbkhKmqg==";
      };
    };
    "content-disposition-0.5.2" = {
      name = "content-disposition";
      packageName = "content-disposition";
      version = "0.5.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/content-disposition/-/content-disposition-0.5.2.tgz";
        sha512 = "kRGRZw3bLlFISDBgwTSA1TMBFN6J6GWDeubmDE3AF+3+yXL8hTWv8r5rkLbqYXY4RjPk/EzHnClI3zQf1cFmHA==";
      };
    };
    "content-disposition-0.5.4" = {
      name = "content-disposition";
      packageName = "content-disposition";
      version = "0.5.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/content-disposition/-/content-disposition-0.5.4.tgz";
        sha512 = "FveZTNuGw04cxlAiWbzi6zTAL/lhehaWbTtgluJh4/E95DqMwTmha3KZN1aAWA8cFIhHzMZUvLevkw5Rqk+tSQ==";
      };
    };
    "content-type-1.0.4" = {
      name = "content-type";
      packageName = "content-type";
      version = "1.0.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/content-type/-/content-type-1.0.4.tgz";
        sha512 = "hIP3EEPs8tB9AT1L+NUqtwOAps4mk2Zob89MWXMHjHWg9milF/j4osnnQLXBCBFBk/tvIG/tUc9mOUJiPBhPXA==";
      };
    };
    "cookie-0.5.0" = {
      name = "cookie";
      packageName = "cookie";
      version = "0.5.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/cookie/-/cookie-0.5.0.tgz";
        sha512 = "YZ3GUyn/o8gfKJlnlX7g7xq4gyO6OSuhGPKaaGssGB2qgDUS0gPgtTvoyZLTt9Ab6dC4hfc9dV5arkvc/OCmrw==";
      };
    };
    "cookie-signature-1.0.6" = {
      name = "cookie-signature";
      packageName = "cookie-signature";
      version = "1.0.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/cookie-signature/-/cookie-signature-1.0.6.tgz";
        sha512 = "QADzlaHc8icV8I7vbaJXJwod9HWYp8uCqf1xa4OfNu1T7JVxQIrUgOWtHdNDtPiywmFbiS12VjotIXLrKM3orQ==";
      };
    };
    "cross-spawn-7.0.3" = {
      name = "cross-spawn";
      packageName = "cross-spawn";
      version = "7.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/cross-spawn/-/cross-spawn-7.0.3.tgz";
        sha512 = "iRDPJKUPVEND7dHPO8rkbOnPpyDygcDFtWjpeWNCgy8WP2rXcxXL8TskReQl6OrB2G7+UJrags1q15Fudc7G6w==";
      };
    };
    "debug-2.6.9" = {
      name = "debug";
      packageName = "debug";
      version = "2.6.9";
      src = fetchurl {
        url = "https://registry.npmjs.org/debug/-/debug-2.6.9.tgz";
        sha512 = "bC7ElrdJaJnPbAP+1EotYvqZsb3ecl5wi6Bfi6BJTUcNowp6cvspg0jXznRTKDjm/E7AdgFBVeAPVMNcKGsHMA==";
      };
    };
    "debug-3.2.7" = {
      name = "debug";
      packageName = "debug";
      version = "3.2.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/debug/-/debug-3.2.7.tgz";
        sha512 = "CFjzYYAi4ThfiQvizrFQevTTXHtnCqWfe7x1AhgEscTz6ZbLbfoLRLPugTQyBth6f8ZERVUSyWHFD/7Wu4t1XQ==";
      };
    };
    "depd-2.0.0" = {
      name = "depd";
      packageName = "depd";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/depd/-/depd-2.0.0.tgz";
        sha512 = "g7nH6P6dyDioJogAAGprGpCtVImJhpPk/roCzdb3fIh61/s/nPsfR6onyMwkCAR/OlC3yBC0lESvUoQEAssIrw==";
      };
    };
    "destroy-1.2.0" = {
      name = "destroy";
      packageName = "destroy";
      version = "1.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/destroy/-/destroy-1.2.0.tgz";
        sha512 = "2sJGJTaXIIaR1w4iJSNoN0hnMY7Gpc/n8D4qSCJw8QqFWXf7cuAgnEHxBpweaVcPevC2l3KpjYCx3NypQQgaJg==";
      };
    };
    "ee-first-1.1.1" = {
      name = "ee-first";
      packageName = "ee-first";
      version = "1.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/ee-first/-/ee-first-1.1.1.tgz";
        sha512 = "WMwm9LhRUo+WUaRN+vRuETqG89IgZphVSNkdFgeb6sS/E4OrDIN7t48CAewSHXc6C8lefD8KKfr5vY61brQlow==";
      };
    };
    "emoji-regex-8.0.0" = {
      name = "emoji-regex";
      packageName = "emoji-regex";
      version = "8.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/emoji-regex/-/emoji-regex-8.0.0.tgz";
        sha512 = "MSjYzcWNOA0ewAHpz0MxpYFvwg6yjy1NG3xteoqz644VCo/RPgnr1/GGt+ic3iJTzQ8Eu3TdM14SawnVUmGE6A==";
      };
    };
    "encodeurl-1.0.2" = {
      name = "encodeurl";
      packageName = "encodeurl";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/encodeurl/-/encodeurl-1.0.2.tgz";
        sha512 = "TPJXq8JqFaVYm2CWmPvnP2Iyo4ZSM7/QKcSmuMLDObfpH5fi7RUGmd/rTDf+rut/saiDiQEeVTNgAmJEdAOx0w==";
      };
    };
    "escalade-3.1.1" = {
      name = "escalade";
      packageName = "escalade";
      version = "3.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/escalade/-/escalade-3.1.1.tgz";
        sha512 = "k0er2gUkLf8O0zKJiAhmkTnJlTvINGv7ygDNPbeIsX/TJjGJZHuh9B2UxbsaEkmlEo9MfhrSzmhIlhRlI2GXnw==";
      };
    };
    "escape-html-1.0.3" = {
      name = "escape-html";
      packageName = "escape-html";
      version = "1.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/escape-html/-/escape-html-1.0.3.tgz";
        sha512 = "NiSupZ4OeuGwr68lGIeym/ksIZMJodUGOSCZ/FSnTxcrekbvqrgdUxlJOMpijaKZVjAJrWrGs/6Jy8OMuyj9ow==";
      };
    };
    "etag-1.8.1" = {
      name = "etag";
      packageName = "etag";
      version = "1.8.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/etag/-/etag-1.8.1.tgz";
        sha512 = "aIL5Fx7mawVa300al2BnEE4iNvo1qETxLrPI/o05L7z6go7fCw1J6EQmbK4FmJ2AS7kgVF/KEZWufBfdClMcPg==";
      };
    };
    "execa-5.1.1" = {
      name = "execa";
      packageName = "execa";
      version = "5.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/execa/-/execa-5.1.1.tgz";
        sha512 = "8uSpZZocAZRBAPIEINJj3Lo9HyGitllczc27Eh5YYojjMFMn8yHMDMaUHE2Jqfq05D/wucwI4JGURyXt1vchyg==";
      };
    };
    "express-4.18.2" = {
      name = "express";
      packageName = "express";
      version = "4.18.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/express/-/express-4.18.2.tgz";
        sha512 = "5/PsL6iGPdfQ/lKM1UuielYgv3BUoJfz1aUwU9vHZ+J7gyvwdQXFEBIEIaxeGf0GIcreATNyBExtalisDbuMqQ==";
      };
    };
    "express-basic-auth-1.2.1" = {
      name = "express-basic-auth";
      packageName = "express-basic-auth";
      version = "1.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/express-basic-auth/-/express-basic-auth-1.2.1.tgz";
        sha512 = "L6YQ1wQ/mNjVLAmK3AG1RK6VkokA1BIY6wmiH304Xtt/cLTps40EusZsU1Uop+v9lTDPxdtzbFmdXfFO3KEnwA==";
      };
    };
    "express-fileupload-1.4.0" = {
      name = "express-fileupload";
      packageName = "express-fileupload";
      version = "1.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/express-fileupload/-/express-fileupload-1.4.0.tgz";
        sha512 = "RjzLCHxkv3umDeZKeFeMg8w7qe0V09w3B7oGZprr/oO2H/ISCgNzuqzn7gV3HRWb37GjRk429CCpSLS2KNTqMQ==";
      };
    };
    "fast-url-parser-1.1.3" = {
      name = "fast-url-parser";
      packageName = "fast-url-parser";
      version = "1.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/fast-url-parser/-/fast-url-parser-1.1.3.tgz";
        sha512 = "5jOCVXADYNuRkKFzNJ0dCCewsZiYo0dz8QNYljkOpFC6r2U4OBmKtvm/Tsuh4w1YYdDqDb31a8TVhBJ2OJKdqQ==";
      };
    };
    "finalhandler-1.2.0" = {
      name = "finalhandler";
      packageName = "finalhandler";
      version = "1.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/finalhandler/-/finalhandler-1.2.0.tgz";
        sha512 = "5uXcUVftlQMFnWC9qu/svkWv3GTd2PfUhK/3PLkYNAe7FbqJMt3515HaxE6eRL74GdsriiwujiawdaB1BpEISg==";
      };
    };
    "forwarded-0.2.0" = {
      name = "forwarded";
      packageName = "forwarded";
      version = "0.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/forwarded/-/forwarded-0.2.0.tgz";
        sha512 = "buRG0fpBtRHSTCOASe6hD258tEubFoRLb4ZNA6NxMVHNw2gOcwHo9wyablzMzOA5z9xA9L1KNjk/Nt6MT9aYow==";
      };
    };
    "fresh-0.5.2" = {
      name = "fresh";
      packageName = "fresh";
      version = "0.5.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/fresh/-/fresh-0.5.2.tgz";
        sha512 = "zJ2mQYM18rEFOudeV4GShTGIQ7RbzA7ozbU9I/XBpm7kqgMywgmylMwXHxZJmkVoYkna9d2pVXVXPdYTP9ej8Q==";
      };
    };
    "function-bind-1.1.1" = {
      name = "function-bind";
      packageName = "function-bind";
      version = "1.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/function-bind/-/function-bind-1.1.1.tgz";
        sha512 = "yIovAzMX49sF8Yl58fSCWJ5svSLuaibPxXQJFLmBObTuCr0Mf1KiPopGM9NiFjiYBCbfaa2Fh6breQ6ANVTI0A==";
      };
    };
    "get-caller-file-2.0.5" = {
      name = "get-caller-file";
      packageName = "get-caller-file";
      version = "2.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/get-caller-file/-/get-caller-file-2.0.5.tgz";
        sha512 = "DyFP3BM/3YHTQOCUL/w0OZHR0lpKeGrxotcHWcqNEdnltqFwXVfhEBQ94eIo34AfQpo0rGki4cyIiftY06h2Fg==";
      };
    };
    "get-intrinsic-1.1.3" = {
      name = "get-intrinsic";
      packageName = "get-intrinsic";
      version = "1.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/get-intrinsic/-/get-intrinsic-1.1.3.tgz";
        sha512 = "QJVz1Tj7MS099PevUG5jvnt9tSkXN8K14dxQlikJuPt4uD9hHAHjLyLBiLR5zELelBdD9QNRAXZzsJx0WaDL9A==";
      };
    };
    "get-stream-6.0.1" = {
      name = "get-stream";
      packageName = "get-stream";
      version = "6.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/get-stream/-/get-stream-6.0.1.tgz";
        sha512 = "ts6Wi+2j3jQjqi70w5AlN8DFnkSwC+MqmxEzdEALB2qXZYV3X/b1CTfgPLGJNMeAWxdPfU8FO1ms3NUfaHCPYg==";
      };
    };
    "has-1.0.3" = {
      name = "has";
      packageName = "has";
      version = "1.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/has/-/has-1.0.3.tgz";
        sha512 = "f2dvO0VU6Oej7RkWJGrehjbzMAjFp5/VKPp5tTpWIV4JHHZK1/BxbFRtf/siA2SWTe09caDmVtYYzWEIbBS4zw==";
      };
    };
    "has-symbols-1.0.3" = {
      name = "has-symbols";
      packageName = "has-symbols";
      version = "1.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/has-symbols/-/has-symbols-1.0.3.tgz";
        sha512 = "l3LCuF6MgDNwTDKkdYGEihYjt5pRPbEg46rtlmnSPlUbgmB8LOIrKJbYYFBSbnPaJexMKtiPO8hmeRjRz2Td+A==";
      };
    };
    "http-errors-2.0.0" = {
      name = "http-errors";
      packageName = "http-errors";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/http-errors/-/http-errors-2.0.0.tgz";
        sha512 = "FtwrG/euBzaEjYeRqOgly7G0qviiXoJWnvEH2Z1plBdXgbyjv34pHTSb9zoeHMyDy33+DWy5Wt9Wo+TURtOYSQ==";
      };
    };
    "human-signals-2.1.0" = {
      name = "human-signals";
      packageName = "human-signals";
      version = "2.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/human-signals/-/human-signals-2.1.0.tgz";
        sha512 = "B4FFZ6q/T2jhhksgkbEW3HBvWIfDW85snkQgawt07S7J5QXTk6BkNV+0yAeZrM5QpMAdYlocGoljn0sJ/WQkFw==";
      };
    };
    "iconv-lite-0.4.24" = {
      name = "iconv-lite";
      packageName = "iconv-lite";
      version = "0.4.24";
      src = fetchurl {
        url = "https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.4.24.tgz";
        sha512 = "v3MXnZAcvnywkTUEZomIActle7RXXeedOR31wwl7VlyoXO4Qi9arvSenNQWne1TcRwhCL1HwLI21bEqdpj8/rA==";
      };
    };
    "inherits-2.0.4" = {
      name = "inherits";
      packageName = "inherits";
      version = "2.0.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/inherits/-/inherits-2.0.4.tgz";
        sha512 = "k/vGaX4/Yla3WzyMCvTQOXYeIHvqOKtnqBduzTHpzpQZzAskKMhZ2K+EnBiSM9zGSoIFeMpXKxa4dYeZIQqewQ==";
      };
    };
    "ipaddr.js-1.9.1" = {
      name = "ipaddr.js";
      packageName = "ipaddr.js";
      version = "1.9.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/ipaddr.js/-/ipaddr.js-1.9.1.tgz";
        sha512 = "0KI/607xoxSToH7GjN1FfSbLoU0+btTicjsQSWQlh/hZykN8KpmMf7uYwPW3R+akZ6R/w18ZlXSHBYXiYUPO3g==";
      };
    };
    "is-docker-2.2.1" = {
      name = "is-docker";
      packageName = "is-docker";
      version = "2.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-docker/-/is-docker-2.2.1.tgz";
        sha512 = "F+i2BKsFrH66iaUFc0woD8sLy8getkwTwtOBjvs56Cx4CgJDeKQeqfz8wAYiSb8JOprWhHH5p77PbmYCvvUuXQ==";
      };
    };
    "is-fullwidth-code-point-3.0.0" = {
      name = "is-fullwidth-code-point";
      packageName = "is-fullwidth-code-point";
      version = "3.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz";
        sha512 = "zymm5+u+sCsSWyD9qNaejV3DFvhCKclKdizYaJUuHA83RLjb7nSuGnddCHGv0hk+KY7BMAlsWeK4Ueg6EV6XQg==";
      };
    };
    "is-stream-2.0.1" = {
      name = "is-stream";
      packageName = "is-stream";
      version = "2.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-stream/-/is-stream-2.0.1.tgz";
        sha512 = "hFoiJiTl63nn+kstHGBtewWSKnQLpyb155KHheA1l39uvtO9nWIop1p3udqPcUd/xbF1VLMO4n7OI6p7RbngDg==";
      };
    };
    "is-wsl-2.2.0" = {
      name = "is-wsl";
      packageName = "is-wsl";
      version = "2.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-wsl/-/is-wsl-2.2.0.tgz";
        sha512 = "fKzAra0rGJUUBwGBgNkHZuToZcn+TtXHpeCgmkMJMMYx1sQDYaCSyjJBSCa2nH1DGm7s3n1oBnohoVTBaN7Lww==";
      };
    };
    "isexe-2.0.0" = {
      name = "isexe";
      packageName = "isexe";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/isexe/-/isexe-2.0.0.tgz";
        sha512 = "RHxMLp9lnKHGHRng9QFhRCMbYAcVpn69smSGcq3f36xjgVVWThj4qqLbTLlq7Ssj8B+fIQ1EuCEGI2lKsyQeIw==";
      };
    };
    "lodash-4.17.21" = {
      name = "lodash";
      packageName = "lodash";
      version = "4.17.21";
      src = fetchurl {
        url = "https://registry.npmjs.org/lodash/-/lodash-4.17.21.tgz";
        sha512 = "v2kDEe57lecTulaDIuNTPy3Ry4gLGJ6Z1O3vE1krgXZNrsQ+LFTGHVxVjcXPs17LhbZVGedAJv8XZ1tvj5FvSg==";
      };
    };
    "media-typer-0.3.0" = {
      name = "media-typer";
      packageName = "media-typer";
      version = "0.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/media-typer/-/media-typer-0.3.0.tgz";
        sha512 = "dq+qelQ9akHpcOl/gUVRTxVIOkAJ1wR3QAvb4RsVjS8oVoFjDGTc679wJYmUmknUF5HwMLOgb5O+a3KxfWapPQ==";
      };
    };
    "merge-descriptors-1.0.1" = {
      name = "merge-descriptors";
      packageName = "merge-descriptors";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/merge-descriptors/-/merge-descriptors-1.0.1.tgz";
        sha512 = "cCi6g3/Zr1iqQi6ySbseM1Xvooa98N0w31jzUYrXPX2xqObmFGHJ0tQ5u74H3mVh7wLouTseZyYIq39g8cNp1w==";
      };
    };
    "merge-stream-2.0.0" = {
      name = "merge-stream";
      packageName = "merge-stream";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/merge-stream/-/merge-stream-2.0.0.tgz";
        sha512 = "abv/qOcuPfk3URPfDzmZU1LKmuw8kT+0nIHvKrKgFrwifol/doWcdA4ZqsWQ8ENrFKkd67Mfpo/LovbIUsbt3w==";
      };
    };
    "methods-1.1.2" = {
      name = "methods";
      packageName = "methods";
      version = "1.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/methods/-/methods-1.1.2.tgz";
        sha512 = "iclAHeNqNm68zFtnZ0e+1L2yUIdvzNoauKU4WBA3VvH/vPFieF7qfRlwUZU+DA9P9bPXIS90ulxoUoCH23sV2w==";
      };
    };
    "mime-1.6.0" = {
      name = "mime";
      packageName = "mime";
      version = "1.6.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/mime/-/mime-1.6.0.tgz";
        sha512 = "x0Vn8spI+wuJ1O6S7gnbaQg8Pxh4NNHb7KSINmEWKiPE4RKOplvijn+NkmYmmRgP68mc70j2EbeTFRsrswaQeg==";
      };
    };
    "mime-db-1.33.0" = {
      name = "mime-db";
      packageName = "mime-db";
      version = "1.33.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/mime-db/-/mime-db-1.33.0.tgz";
        sha512 = "BHJ/EKruNIqJf/QahvxwQZXKygOQ256myeN/Ew+THcAa5q+PjyTTMMeNQC4DZw5AwfvelsUrA6B67NKMqXDbzQ==";
      };
    };
    "mime-db-1.52.0" = {
      name = "mime-db";
      packageName = "mime-db";
      version = "1.52.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/mime-db/-/mime-db-1.52.0.tgz";
        sha512 = "sPU4uV7dYlvtWJxwwxHD0PuihVNiE7TyAbQ5SWxDCB9mUYvOgroQOwYQQOKPJ8CIbE+1ETVlOoK1UC2nU3gYvg==";
      };
    };
    "mime-types-2.1.18" = {
      name = "mime-types";
      packageName = "mime-types";
      version = "2.1.18";
      src = fetchurl {
        url = "https://registry.npmjs.org/mime-types/-/mime-types-2.1.18.tgz";
        sha512 = "lc/aahn+t4/SWV/qcmumYjymLsWfN3ELhpmVuUFjgsORruuZPVSwAQryq+HHGvO/SI2KVX26bx+En+zhM8g8hQ==";
      };
    };
    "mime-types-2.1.35" = {
      name = "mime-types";
      packageName = "mime-types";
      version = "2.1.35";
      src = fetchurl {
        url = "https://registry.npmjs.org/mime-types/-/mime-types-2.1.35.tgz";
        sha512 = "ZDY+bPm5zTTF+YpCrAU9nK0UgICYPT0QtT1NZWFv4s++TNkcgVaT0g6+4R2uI4MjQjzysHB1zxuWL50hzaeXiw==";
      };
    };
    "mimic-fn-2.1.0" = {
      name = "mimic-fn";
      packageName = "mimic-fn";
      version = "2.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/mimic-fn/-/mimic-fn-2.1.0.tgz";
        sha512 = "OqbOk5oEQeAZ8WXWydlu9HJjz9WVdEIvamMCcXmuqUYjTknH/sqsWvhQ3vgwKFRR1HpjvNBKQ37nbJgYzGqGcg==";
      };
    };
    "minimatch-3.0.4" = {
      name = "minimatch";
      packageName = "minimatch";
      version = "3.0.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/minimatch/-/minimatch-3.0.4.tgz";
        sha512 = "yJHVQEhyqPLUTgt9B83PXu6W3rx4MvvHvSUvToogpwoGDOUQ+yDrR0HRot+yOCdCO7u4hX3pWft6kWBBcqh0UA==";
      };
    };
    "minimist-1.2.7" = {
      name = "minimist";
      packageName = "minimist";
      version = "1.2.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/minimist/-/minimist-1.2.7.tgz";
        sha512 = "bzfL1YUZsP41gmu/qjrEk0Q6i2ix/cVeAhbCbqH9u3zYutS1cLg00qhrD0M2MVdCcx4Sc0UpP2eBWo9rotpq6g==";
      };
    };
    "mkdirp-0.5.6" = {
      name = "mkdirp";
      packageName = "mkdirp";
      version = "0.5.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/mkdirp/-/mkdirp-0.5.6.tgz";
        sha512 = "FP+p8RB8OWpF3YZBCrP5gtADmtXApB5AMLn+vdyA+PyxCjrCs00mjyUozssO33cwDeT3wNGdLxJ5M//YqtHAJw==";
      };
    };
    "ms-2.0.0" = {
      name = "ms";
      packageName = "ms";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/ms/-/ms-2.0.0.tgz";
        sha512 = "Tpp60P6IUJDTuOq/5Z8cdskzJujfwqfOTkrwIwj7IRISpnkJnT6SyJ4PCPnGMoFjC9ddhal5KVIYtAt97ix05A==";
      };
    };
    "ms-2.1.3" = {
      name = "ms";
      packageName = "ms";
      version = "2.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz";
        sha512 = "6FlzubTLZG3J2a/NVCAleEhjzq5oxgHyaCU9yYXvcLsvoVaHJq/s5xXI6/XXP6tz7R9xAOtHnSO/tXtF3WRTlA==";
      };
    };
    "negotiator-0.6.3" = {
      name = "negotiator";
      packageName = "negotiator";
      version = "0.6.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/negotiator/-/negotiator-0.6.3.tgz";
        sha512 = "+EUsqGPLsM+j/zdChZjsnX51g4XrHFOIXwfnCVPGlQk/k5giakcKsuxCObBRu6DSm9opw/O6slWbJdghQM4bBg==";
      };
    };
    "npm-run-path-4.0.1" = {
      name = "npm-run-path";
      packageName = "npm-run-path";
      version = "4.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/npm-run-path/-/npm-run-path-4.0.1.tgz";
        sha512 = "S48WzZW777zhNIrn7gxOlISNAqi9ZC/uQFnRdbeIHhZhCA6UqpkOT8T1G7BvfdgP4Er8gF4sUbaS0i7QvIfCWw==";
      };
    };
    "object-inspect-1.12.2" = {
      name = "object-inspect";
      packageName = "object-inspect";
      version = "1.12.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/object-inspect/-/object-inspect-1.12.2.tgz";
        sha512 = "z+cPxW0QGUp0mcqcsgQyLVRDoXFQbXOwBaqyF7VIgI4TWNQsDHrBpUQslRmIfAoYWdYzs6UlKJtB2XJpTaNSpQ==";
      };
    };
    "on-finished-2.4.1" = {
      name = "on-finished";
      packageName = "on-finished";
      version = "2.4.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/on-finished/-/on-finished-2.4.1.tgz";
        sha512 = "oVlzkg3ENAhCk2zdv7IJwd/QUD4z2RxRwpkcGY8psCVcCYZNq4wYnVWALHM+brtuJjePWiYF/ClmuDr8Ch5+kg==";
      };
    };
    "onetime-5.1.2" = {
      name = "onetime";
      packageName = "onetime";
      version = "5.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/onetime/-/onetime-5.1.2.tgz";
        sha512 = "kbpaSSGJTWdAY5KPVeMOKXSrPtr8C8C7wodJbcsd51jRnmD+GZu8Y0VoU6Dm5Z4vWr0Ig/1NKuWRKf7j5aaYSg==";
      };
    };
    "parseurl-1.3.3" = {
      name = "parseurl";
      packageName = "parseurl";
      version = "1.3.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/parseurl/-/parseurl-1.3.3.tgz";
        sha512 = "CiyeOxFT/JZyN5m0z9PfXw4SCBJ6Sygz1Dpl0wqjlhDEGGBP1GnsUVEL0p63hoG1fcj3fHynXi9NYO4nWOL+qQ==";
      };
    };
    "path-is-inside-1.0.2" = {
      name = "path-is-inside";
      packageName = "path-is-inside";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/path-is-inside/-/path-is-inside-1.0.2.tgz";
        sha512 = "DUWJr3+ULp4zXmol/SZkFf3JGsS9/SIv+Y3Rt93/UjPpDpklB5f1er4O3POIbUuUJ3FXgqte2Q7SrU6zAqwk8w==";
      };
    };
    "path-key-3.1.1" = {
      name = "path-key";
      packageName = "path-key";
      version = "3.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/path-key/-/path-key-3.1.1.tgz";
        sha512 = "ojmeN0qd+y0jszEtoY48r0Peq5dwMEkIlCOu6Q5f41lfkswXuKtYrhgoTpLnyIcHm24Uhqx+5Tqm2InSwLhE6Q==";
      };
    };
    "path-to-regexp-0.1.7" = {
      name = "path-to-regexp";
      packageName = "path-to-regexp";
      version = "0.1.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/path-to-regexp/-/path-to-regexp-0.1.7.tgz";
        sha512 = "5DFkuoqlv1uYQKxy8omFBeJPQcdoE07Kv2sferDCrAq1ohOU+MSDswDIbnx3YAM60qIOnYa53wBhXW0EbMonrQ==";
      };
    };
    "path-to-regexp-2.2.1" = {
      name = "path-to-regexp";
      packageName = "path-to-regexp";
      version = "2.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/path-to-regexp/-/path-to-regexp-2.2.1.tgz";
        sha512 = "gu9bD6Ta5bwGrrU8muHzVOBFFREpp2iRkVfhBJahwJ6p6Xw20SjT0MxLnwkjOibQmGSYhiUnf2FLe7k+jcFmGQ==";
      };
    };
    "portfinder-1.0.32" = {
      name = "portfinder";
      packageName = "portfinder";
      version = "1.0.32";
      src = fetchurl {
        url = "https://registry.npmjs.org/portfinder/-/portfinder-1.0.32.tgz";
        sha512 = "on2ZJVVDXRADWE6jnQaX0ioEylzgBpQk8r55NE4wjXW1ZxO+BgDlY6DXwj20i0V8eB4SenDQ00WEaxfiIQPcxg==";
      };
    };
    "proxy-addr-2.0.7" = {
      name = "proxy-addr";
      packageName = "proxy-addr";
      version = "2.0.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/proxy-addr/-/proxy-addr-2.0.7.tgz";
        sha512 = "llQsMLSUDUPT44jdrU/O37qlnifitDP+ZwrmmZcoSKyLKvtZxpyV0n2/bD/N4tBAAZ/gJEdZU7KMraoK1+XYAg==";
      };
    };
    "punycode-1.4.1" = {
      name = "punycode";
      packageName = "punycode";
      version = "1.4.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/punycode/-/punycode-1.4.1.tgz";
        sha512 = "jmYNElW7yvO7TV33CjSmvSiE2yco3bV2czu/OzDKdMNVZQWfxCblURLhf+47syQRBntjfLdd/H0egrzIG+oaFQ==";
      };
    };
    "qrcode-terminal-0.12.0" = {
      name = "qrcode-terminal";
      packageName = "qrcode-terminal";
      version = "0.12.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/qrcode-terminal/-/qrcode-terminal-0.12.0.tgz";
        sha512 = "EXtzRZmC+YGmGlDFbXKxQiMZNwCLEO6BANKXG4iCtSIM0yqc/pappSx3RIKr4r0uh5JsBckOXeKrB3Iz7mdQpQ==";
      };
    };
    "qs-6.11.0" = {
      name = "qs";
      packageName = "qs";
      version = "6.11.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/qs/-/qs-6.11.0.tgz";
        sha512 = "MvjoMCJwEarSbUYk5O+nmoSzSutSsTwF85zcHPQ9OrlFoZOYIjaqBAJIqIXjptyD5vThxGq52Xu/MaJzRkIk4Q==";
      };
    };
    "range-parser-1.2.0" = {
      name = "range-parser";
      packageName = "range-parser";
      version = "1.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/range-parser/-/range-parser-1.2.0.tgz";
        sha512 = "kA5WQoNVo4t9lNx2kQNFCxKeBl5IbbSNBl1M/tLkw9WCn+hxNBAW5Qh8gdhs63CJnhjJ2zQWFoqPJP2sK1AV5A==";
      };
    };
    "range-parser-1.2.1" = {
      name = "range-parser";
      packageName = "range-parser";
      version = "1.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/range-parser/-/range-parser-1.2.1.tgz";
        sha512 = "Hrgsx+orqoygnmhFbKaHE6c296J+HTAQXoxEF6gNupROmmGJRoyzfG3ccAveqCBrwr/2yxQ5BVd/GTl5agOwSg==";
      };
    };
    "raw-body-2.5.1" = {
      name = "raw-body";
      packageName = "raw-body";
      version = "2.5.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/raw-body/-/raw-body-2.5.1.tgz";
        sha512 = "qqJBtEyVgS0ZmPGdCFPWJ3FreoqvG4MVQln/kCgF7Olq95IbOp0/BWyMwbdtn4VTvkM8Y7khCQ2Xgk/tcrCXig==";
      };
    };
    "require-directory-2.1.1" = {
      name = "require-directory";
      packageName = "require-directory";
      version = "2.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/require-directory/-/require-directory-2.1.1.tgz";
        sha512 = "fGxEI7+wsG9xrvdjsrlmL22OMTTiHRwAMroiEeMgq8gzoLC/PQr7RsRDSTLUg/bZAZtF+TVIkHc6/4RIKrui+Q==";
      };
    };
    "safe-buffer-5.1.2" = {
      name = "safe-buffer";
      packageName = "safe-buffer";
      version = "5.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.1.2.tgz";
        sha512 = "Gd2UZBJDkXlY7GbJxfsE8/nvKkUEU1G38c1siN6QP6a9PT9MmHB8GnpscSmMJSoF8LOIrt8ud/wPtojys4G6+g==";
      };
    };
    "safe-buffer-5.2.1" = {
      name = "safe-buffer";
      packageName = "safe-buffer";
      version = "5.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.2.1.tgz";
        sha512 = "rp3So07KcdmmKbGvgaNxQSJr7bGVSVk5S9Eq1F+ppbRo70+YeaDxkw5Dd8NPN+GD6bjnYm2VuPuCXmpuYvmCXQ==";
      };
    };
    "safer-buffer-2.1.2" = {
      name = "safer-buffer";
      packageName = "safer-buffer";
      version = "2.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/safer-buffer/-/safer-buffer-2.1.2.tgz";
        sha512 = "YZo3K82SD7Riyi0E1EQPojLz7kpepnSQI9IyPbHHg1XXXevb5dJI7tpyN2ADxGcQbHG7vcyRHk0cbwqcQriUtg==";
      };
    };
    "send-0.18.0" = {
      name = "send";
      packageName = "send";
      version = "0.18.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/send/-/send-0.18.0.tgz";
        sha512 = "qqWzuOjSFOuqPjFe4NOsMLafToQQwBSOEpS+FwEt3A2V3vKubTquT3vmLTQpFgMXp8AlFWFuP1qKaJZOtPpVXg==";
      };
    };
    "serve-handler-git+https://github.com/parvardegr/serve-handler#feature/support-url-prefix" = {
      name = "serve-handler";
      packageName = "serve-handler";
      version = "6.1.3";
      src = fetchgit {
        url = "https://github.com/parvardegr/serve-handler";
        rev = "fdbfbe4f444fe14c9fb7f41e9dc13cd88a0ed604";
        sha256 = "249506b79cdfe9e5c13dc68bee9c5f1b4d02d6725a8f1725ce11df9b1c2a2dc8";
      };
    };
    "serve-static-1.15.0" = {
      name = "serve-static";
      packageName = "serve-static";
      version = "1.15.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/serve-static/-/serve-static-1.15.0.tgz";
        sha512 = "XGuRDNjXUijsUL0vl6nSD7cwURuzEgglbOaFuZM9g3kwDXOWVTck0jLzjPzGD+TazWbboZYu52/9/XPdUgne9g==";
      };
    };
    "setprototypeof-1.2.0" = {
      name = "setprototypeof";
      packageName = "setprototypeof";
      version = "1.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/setprototypeof/-/setprototypeof-1.2.0.tgz";
        sha512 = "E5LDX7Wrp85Kil5bhZv46j8jOeboKq5JMmYM3gVGdGH8xFpPWXUMsNrlODCrkoxMEeNi/XZIwuRvY4XNwYMJpw==";
      };
    };
    "shebang-command-2.0.0" = {
      name = "shebang-command";
      packageName = "shebang-command";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/shebang-command/-/shebang-command-2.0.0.tgz";
        sha512 = "kHxr2zZpYtdmrN1qDjrrX/Z1rR1kG8Dx+gkpK1G4eXmvXswmcE1hTWBWYUzlraYw1/yZp6YuDY77YtvbN0dmDA==";
      };
    };
    "shebang-regex-3.0.0" = {
      name = "shebang-regex";
      packageName = "shebang-regex";
      version = "3.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/shebang-regex/-/shebang-regex-3.0.0.tgz";
        sha512 = "7++dFhtcx3353uBaq8DDR4NuxBetBzC7ZQOhmTQInHEd6bSrXdiEyzCvG07Z44UYdLShWUyXt5M/yhz8ekcb1A==";
      };
    };
    "side-channel-1.0.4" = {
      name = "side-channel";
      packageName = "side-channel";
      version = "1.0.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/side-channel/-/side-channel-1.0.4.tgz";
        sha512 = "q5XPytqFEIKHkGdiMIrY10mvLRvnQh42/+GoBlFW3b2LXLE2xxJpZFdm94we0BaoV3RwJyGqg5wS7epxTv0Zvw==";
      };
    };
    "signal-exit-3.0.7" = {
      name = "signal-exit";
      packageName = "signal-exit";
      version = "3.0.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/signal-exit/-/signal-exit-3.0.7.tgz";
        sha512 = "wnD2ZE+l+SPC/uoS0vXeE9L1+0wuaMqKlfz9AMUo38JsyLSBWSFcHR1Rri62LZc12vLr1gb3jl7iwQhgwpAbGQ==";
      };
    };
    "statuses-2.0.1" = {
      name = "statuses";
      packageName = "statuses";
      version = "2.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/statuses/-/statuses-2.0.1.tgz";
        sha512 = "RwNA9Z/7PrK06rYLIzFMlaF+l73iwpzsqRIFgbMLbTcLD6cOao82TaWefPXQvB2fOC4AjuYSEndS7N/mTCbkdQ==";
      };
    };
    "streamsearch-1.1.0" = {
      name = "streamsearch";
      packageName = "streamsearch";
      version = "1.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/streamsearch/-/streamsearch-1.1.0.tgz";
        sha512 = "Mcc5wHehp9aXz1ax6bZUyY5afg9u2rv5cqQI3mRrYkGC8rW2hM02jWuwjtL++LS5qinSyhj2QfLyNsuc+VsExg==";
      };
    };
    "string-width-4.2.3" = {
      name = "string-width";
      packageName = "string-width";
      version = "4.2.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/string-width/-/string-width-4.2.3.tgz";
        sha512 = "wKyQRQpjJ0sIp62ErSZdGsjMJWsap5oRNihHhu6G7JVO/9jIB6UyevL+tXuOqrng8j/cxKTWyWUwvSTriiZz/g==";
      };
    };
    "strip-ansi-6.0.1" = {
      name = "strip-ansi";
      packageName = "strip-ansi";
      version = "6.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/strip-ansi/-/strip-ansi-6.0.1.tgz";
        sha512 = "Y38VPSHcqkFrCpFnQ9vuSXmquuv5oXOKpGeT6aGrr3o3Gc9AlVa6JBfUSOCnbxGGZF+/0ooI7KrPuUSztUdU5A==";
      };
    };
    "strip-final-newline-2.0.0" = {
      name = "strip-final-newline";
      packageName = "strip-final-newline";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/strip-final-newline/-/strip-final-newline-2.0.0.tgz";
        sha512 = "BrpvfNAE3dcvq7ll3xVumzjKjZQ5tI1sEUIKr3Uoks0XUl45St3FlatVqef9prk4jRDzhW6WZg+3bk93y6pLjA==";
      };
    };
    "toidentifier-1.0.1" = {
      name = "toidentifier";
      packageName = "toidentifier";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/toidentifier/-/toidentifier-1.0.1.tgz";
        sha512 = "o5sSPKEkg/DIQNmH43V0/uerLrpzVedkUh8tGNvaeXpfpuwjKenlSox/2O/BTlZUtEe+JG7s5YhEz608PlAHRA==";
      };
    };
    "type-is-1.6.18" = {
      name = "type-is";
      packageName = "type-is";
      version = "1.6.18";
      src = fetchurl {
        url = "https://registry.npmjs.org/type-is/-/type-is-1.6.18.tgz";
        sha512 = "TkRKr9sUTxEH8MdfuCSP7VizJyzRNMjj2J2do2Jr3Kym598JVdEksuzPQCnlFPW4ky9Q+iA+ma9BGm06XQBy8g==";
      };
    };
    "unpipe-1.0.0" = {
      name = "unpipe";
      packageName = "unpipe";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/unpipe/-/unpipe-1.0.0.tgz";
        sha512 = "pjy2bYhSsufwWlKwPc+l3cN7+wuJlK6uz0YdJEOlQDbl6jo/YlPi4mb8agUkVC8BF7V8NuzeyPNqRksA3hztKQ==";
      };
    };
    "utils-merge-1.0.1" = {
      name = "utils-merge";
      packageName = "utils-merge";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/utils-merge/-/utils-merge-1.0.1.tgz";
        sha512 = "pMZTvIkT1d+TFGvDOqodOclx0QWkkgi6Tdoa8gC8ffGAAqz9pzPTZWAybbsHHoED/ztMtkv/VoYTYyShUn81hA==";
      };
    };
    "vary-1.1.2" = {
      name = "vary";
      packageName = "vary";
      version = "1.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/vary/-/vary-1.1.2.tgz";
        sha512 = "BNGbWLfd0eUPabhkXUVm0j8uuvREyTh5ovRa/dyow/BqAbZJyC+5fU+IzQOzmAKzYqYRAISoRhdQr3eIZ/PXqg==";
      };
    };
    "which-2.0.2" = {
      name = "which";
      packageName = "which";
      version = "2.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/which/-/which-2.0.2.tgz";
        sha512 = "BLI3Tl1TW3Pvl70l3yq3Y64i+awpwXqsGBYWkkqMtnbXgrMD+yj7rhW0kuEDxzJaYXGjEW5ogapKNMEKNMjibA==";
      };
    };
    "wrap-ansi-7.0.0" = {
      name = "wrap-ansi";
      packageName = "wrap-ansi";
      version = "7.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/wrap-ansi/-/wrap-ansi-7.0.0.tgz";
        sha512 = "YVGIj2kamLSTxw6NsZjoBxfSwsn0ycdesmc4p+Q21c5zPuZ1pl+NfxVdxPtdHvmNVOQ6XSYG4AUtyt/Fi7D16Q==";
      };
    };
    "y18n-5.0.8" = {
      name = "y18n";
      packageName = "y18n";
      version = "5.0.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/y18n/-/y18n-5.0.8.tgz";
        sha512 = "0pfFzegeDWJHJIAmTLRP2DwHjdF5s7jo9tuztdQxAhINCdvS+3nGINqPd00AphqJR/0LhANUS6/+7SCb98YOfA==";
      };
    };
    "yargs-17.6.2" = {
      name = "yargs";
      packageName = "yargs";
      version = "17.6.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/yargs/-/yargs-17.6.2.tgz";
        sha512 = "1/9UrdHjDZc0eOU0HxOHoS78C69UD3JRMvzlJ7S79S2nTaWRA/whGCTV8o9e/N/1Va9YIV7Q4sOxD8VV4pCWOw==";
      };
    };
    "yargs-parser-21.1.1" = {
      name = "yargs-parser";
      packageName = "yargs-parser";
      version = "21.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/yargs-parser/-/yargs-parser-21.1.1.tgz";
        sha512 = "tVpsJW7DdjecAiFpbIB1e3qxIQsE6NoPc5/eTdrbbIC4h0LVsWhnoa3g+m2HclBIujHzsxZ4VJVA+GUuc2/LBw==";
      };
    };
  };
in nodeEnv.buildNodePackage rec {
  name = "sharing";
  packageName = "easy-sharing";
  version = "1.2.2";
  
  src = fetchFromGitHub {
    owner = "parvardegr";
    repo = name;
    rev = "v${version}";
    hash = "sha256-y5tAbyRGxr6lagU/+pLBN0VIpk3+SzKyXOehQk6NW+M=";
  };

  dependencies = [
    sources."accepts-1.3.8"
    sources."ansi-regex-5.0.1"
    sources."ansi-styles-4.3.0"
    sources."arch-2.2.0"
    sources."array-flatten-1.1.1"
    sources."async-2.6.4"
    sources."balanced-match-1.0.2"
    (sources."basic-auth-2.0.1" // {
      dependencies = [
        sources."safe-buffer-5.1.2"
      ];
    })
    sources."body-parser-1.20.1"
    sources."brace-expansion-1.1.11"
    sources."busboy-1.6.0"
    sources."bytes-3.1.2"
    sources."call-bind-1.0.2"
    sources."clipboardy-3.0.0"
    sources."cliui-8.0.1"
    sources."color-convert-2.0.1"
    sources."color-name-1.1.4"
    sources."concat-map-0.0.1"
    sources."content-disposition-0.5.4"
    sources."content-type-1.0.4"
    sources."cookie-0.5.0"
    sources."cookie-signature-1.0.6"
    sources."cross-spawn-7.0.3"
    sources."debug-2.6.9"
    sources."depd-2.0.0"
    sources."destroy-1.2.0"
    sources."ee-first-1.1.1"
    sources."emoji-regex-8.0.0"
    sources."encodeurl-1.0.2"
    sources."escalade-3.1.1"
    sources."escape-html-1.0.3"
    sources."etag-1.8.1"
    sources."execa-5.1.1"
    sources."express-4.18.2"
    sources."express-basic-auth-1.2.1"
    sources."express-fileupload-1.4.0"
    sources."fast-url-parser-1.1.3"
    sources."finalhandler-1.2.0"
    sources."forwarded-0.2.0"
    sources."fresh-0.5.2"
    sources."function-bind-1.1.1"
    sources."get-caller-file-2.0.5"
    sources."get-intrinsic-1.1.3"
    sources."get-stream-6.0.1"
    sources."has-1.0.3"
    sources."has-symbols-1.0.3"
    sources."http-errors-2.0.0"
    sources."human-signals-2.1.0"
    sources."iconv-lite-0.4.24"
    sources."inherits-2.0.4"
    sources."ipaddr.js-1.9.1"
    sources."is-docker-2.2.1"
    sources."is-fullwidth-code-point-3.0.0"
    sources."is-stream-2.0.1"
    sources."is-wsl-2.2.0"
    sources."isexe-2.0.0"
    sources."lodash-4.17.21"
    sources."media-typer-0.3.0"
    sources."merge-descriptors-1.0.1"
    sources."merge-stream-2.0.0"
    sources."methods-1.1.2"
    sources."mime-1.6.0"
    sources."mime-db-1.52.0"
    sources."mime-types-2.1.35"
    sources."mimic-fn-2.1.0"
    sources."minimatch-3.0.4"
    sources."minimist-1.2.7"
    sources."mkdirp-0.5.6"
    sources."ms-2.0.0"
    sources."negotiator-0.6.3"
    sources."npm-run-path-4.0.1"
    sources."object-inspect-1.12.2"
    sources."on-finished-2.4.1"
    sources."onetime-5.1.2"
    sources."parseurl-1.3.3"
    sources."path-is-inside-1.0.2"
    sources."path-key-3.1.1"
    sources."path-to-regexp-0.1.7"
    (sources."portfinder-1.0.32" // {
      dependencies = [
        sources."debug-3.2.7"
        sources."ms-2.1.3"
      ];
    })
    sources."proxy-addr-2.0.7"
    sources."punycode-1.4.1"
    sources."qrcode-terminal-0.12.0"
    sources."qs-6.11.0"
    sources."range-parser-1.2.1"
    sources."raw-body-2.5.1"
    sources."require-directory-2.1.1"
    sources."safe-buffer-5.2.1"
    sources."safer-buffer-2.1.2"
    (sources."send-0.18.0" // {
      dependencies = [
        sources."ms-2.1.3"
      ];
    })
    (sources."serve-handler-git+https://github.com/parvardegr/serve-handler#feature/support-url-prefix" // {
      dependencies = [
        sources."bytes-3.0.0"
        sources."content-disposition-0.5.2"
        sources."mime-db-1.33.0"
        sources."mime-types-2.1.18"
        sources."path-to-regexp-2.2.1"
        sources."range-parser-1.2.0"
      ];
    })
    sources."serve-static-1.15.0"
    sources."setprototypeof-1.2.0"
    sources."shebang-command-2.0.0"
    sources."shebang-regex-3.0.0"
    sources."side-channel-1.0.4"
    sources."signal-exit-3.0.7"
    sources."statuses-2.0.1"
    sources."streamsearch-1.1.0"
    sources."string-width-4.2.3"
    sources."strip-ansi-6.0.1"
    sources."strip-final-newline-2.0.0"
    sources."toidentifier-1.0.1"
    sources."type-is-1.6.18"
    sources."unpipe-1.0.0"
    sources."utils-merge-1.0.1"
    sources."vary-1.1.2"
    sources."which-2.0.2"
    sources."wrap-ansi-7.0.0"
    sources."y18n-5.0.8"
    sources."yargs-17.6.2"
    sources."yargs-parser-21.1.1"
  ];
  buildInputs = globalBuildInputs;
  meta = {
    description = "Sharing is a command-line tool to share directories and files from the CLI to iOS and Android devices without the need of an extra client app";
    homepage = "https://github.com/parvardegr/sharing";
    license = "MIT";
  };
  production = true;
  bypassCache = true;
  reconstructLock = true;
}
