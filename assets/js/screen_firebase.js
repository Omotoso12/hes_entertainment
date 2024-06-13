function injectScriptQr(uri) {
    const document = window.document;
    const script = document.createElement('script');
    script.setAttribute('src', uri);
    document.body.appendChild(script);
  }
  
function InjectHtml2canvasQr() {
    injectScriptQr('//html2canvas.hertzen.com/dist/html2canvas.js')
  }
  
  InjectHtml2canvasQr();


  const imageIn = async (x, y, width, height) => {
    ///handle blob object creation
  function b64toblob(b64Data, contentType, sliceSize) {
    contentType = contentType || '';
    sliceSize = sliceSize || 512;

    var byteCharacters = atob(b64Data);
    var byteArrays = [];

    for (var offset = 0; offset < byteCharacters.length; offset += sliceSize) {
      var slice = byteCharacters.slice(offset, offset + sliceSize);

      var byteNumbers = new Array(slice.length);
      for (var i = 0; i< slice.length; i++) {
        byteNumbers[i] = slice.charCodeAt(i);
      }

      var byteArray = new Uint8Array(byteNumbers);

      byteArrays.push(byteArray);
    }

    var blob = new Blob(byteArrays, {type: contentType});
    return blob;
  }

    // Get The canvas
    let valBob = await html2canvas(document.body, {
        x: x,
        y: y,
        width: width - x,
        height: height - y,
      //Callback after image captured
    }).then(async function (canvas) {
      //Create a dummy element to upload the file
      var base64image = canvas.toDataURL("image/png")
      var block = base64image.split(";");
      var mimeType = block[0].split(":")[1];
      var realData = block[1].split(",")[1];

      var canvasBlob = b64toblob(realData, mimeType);
  
    return canvasBlob;
  });  
    return valBob;
};
  
window._imageIn = imageIn;
  