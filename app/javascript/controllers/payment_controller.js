import { Controller } from "stimulus"
import dropin from "braintree-web-drop-in"

export default class extends Controller {
  static targets = [ "dropin" , "nonce" ]
  static values = {
    token: String,
  }

  connect(){
    const form = this.element.parentNode
    dropin
    .create({
      container: this.dropinTarget,
      authorization: this.tokenValue,
    })
    .then(function(instance){
      form.addEventListener('submit', function(e){
        e.preventDefault()
        instance.requestPaymentMethod().then(function({nonce}){
          this.nonceTarget.value = nonce
          form.submit()
        })
      })
    })
    .catch(function(err){
      console.log("ERROR: ", err);
    })
  }
}
//要給他一個container，知道刷卡機要放在哪裡
//dropin裡面有一個create的方法，create方法裡面要加一個物件

// 官網寫法
// braintree.dropin.create({
//   authorization: 'CLIENT_AUTHORIZATION',
//   selector: '#dropin-container'
// }, function (err, dropinInstance) {
//   if (err) {
//     // Handle any errors that might've occurred when creating Drop-in
//     console.error(err);
//     return;
//   }
// }
