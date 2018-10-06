// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"
import Elm from './main';

const elmDiv = document.querySelector('#elm_target');

if (elmDiv) {
  const app = Elm.Main.embed(elmDiv);

  app.ports.showPromoRegistrationConfirmDialog.subscribe(function() {
    UIkit.modal.dialog('<div class="uk-flex-top uk-margin-auto-vertical"><div class="uk-width-1-1@s uk-modal-body"><h3 style="text-align:center;color:skyblue;">ՇՆՈՐՀԱԿԱԼՈւԹՅՈւՆ՝</h3><p style="font-size:110%;color:black;margin-top:-1em;text-align:center;">մեր հարթակում գրանցվելու համար: Մենք լրացուցիչ կկապվենք Ձեզ հետ և կտեղեկացնենք հետագա քայլերի մասին:</p><p style="margin-right:5%;margin-left:5%;font-size:small;color:black;text-align:center;">Եթե ունեք հարցեր կամ առաջարկություններ, կարող եք կապվել մեզ հետ <a href="https://www.facebook.com/innovities/" target="_blank" style="color:skyblue;display:inline;">facebook</a>-յան էջի միջոցով:</p><p style="color:black;text-align:center;font-size:small;">Հետևեք մեզ</p><div style="margin-top:-1em;"><a href="https://www.facebook.com/innovities/" target="_blank"><div style="display:inline;"><img src="/images/fb_skyblue.png" style="display:inline;width:10%;height:10%;margin-left:33%;margin-right:0.3em;" /></div></a><a href="https://twitter.com/innovities" target="_blank"><div style="display:inline;"><img src="/images/twitter_skyblue.png" style="width:10%;height:10%;margin-right:0.3em;" /></div></a><a href="https://www.linkedin.com/company/innovities/" target="_blank"><div style="display:inline;"><img src="/images/in_skyblue.png" style="width:10%;height:10%;" /></div></a></div><button class="uk-modal-close-default" uk-close /></div></div>');
  });
}

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
