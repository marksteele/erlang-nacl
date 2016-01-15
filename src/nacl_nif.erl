-module(nacl_nif).

-export([randombytes/1,
         hash/1,
         box_keypair/0,
         box_NONCEBYTES/0,
         box_ZEROBYTES/0,
         box_BOXZEROBYTES/0,
         box_padded/4,
         box_open_padded/4,
         secretbox_padded/3,
         secretbox_open_padded/3,
         secretbox_ZEROBYTES/0,
         secretbox_BOXZEROBYTES/0,
         secretbox_NONCEBYTES/0,
         secretbox_KEYBYTES/0
        ]).

-on_load(init/0).

init() ->
  Path = case application:get_env(code,sopath) of
           {ok, CodePath} ->
             CodePath;
           _ ->
             case code:priv_dir(?MODULE) of
               {error, _} ->
                 EbinDir = filename:dirname(code:which(?MODULE)),
                 AppPath = filename:dirname(EbinDir),
                 filename:join(AppPath, "priv");
               CodePath ->
                 CodePath
             end
         end,
  erlang:load_nif(filename:join(Path, ?MODULE), 0).


randombytes(_Count) -> erlang:nif_error(not_loaded).
hash(_Bytes) -> erlang:nif_error(not_loaded).
box_keypair() -> erlang:nif_error(not_loaded).
box_NONCEBYTES() -> erlang:nif_error(not_loaded).
box_ZEROBYTES() -> erlang:nif_error(not_loaded).
box_BOXZEROBYTES() -> erlang:nif_error(not_loaded).
box_padded(_PaddedMsg, _Nonce, _Pk, _Sk) -> erlang:nif_error(not_loaded).
box_open_padded(_PaddedCipher, _Nonce, _Pk, _Sk) -> erlang:nif_error(not_loaded).
secretbox_padded(_Msg, _Nonce, _Key) -> erlang:nif_error(not_loaded).
secretbox_open_padded(_Ciphertext, _Nonce, _Key) -> erlang:nif_error(not_loaded).
secretbox_ZEROBYTES() -> erlang:nif_error(not_loaded).
secretbox_BOXZEROBYTES() -> erlang:nif_error(not_loaded).
secretbox_NONCEBYTES() -> erlang:nif_error(not_loaded).
secretbox_KEYBYTES() -> erlang:nif_error(not_loaded).
