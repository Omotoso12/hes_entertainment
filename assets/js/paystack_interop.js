

const start = () => {
  const paystackPopUp = ( pkText, email, amount, ref, onClosed, callback) => {
  let handler = PaystackPop.setup({
    key: pkText, // Replace with your public key
    email: email,
    amount: amount,
    ref: ref, // generates a pseudo-unique reference. Please replace with a reference you generated. Or remove the line entirely so our API will generate one for you
    // label: "Optional string that replaces customer email"
    onClose: function(){
      alert('Window closed.');
      onClosed();
    },
    callback: function(response){
        
      let message = 'Payment complete! Reference: ' + response.reference;
      alert(message);
      callback();
    }
  });

  handler.openIframe();
}
window._paystackPopUp = paystackPopUp;
}
  
window.onload = () => {
  start();
}
