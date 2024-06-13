function injectScript(uri) {
  const document = window.document;
  const script = document.createElement('script');
  script.setAttribute('src', uri);
  document.body.appendChild(script);
}

function InjectHtml2canvas() {
  injectScript('//html2canvas.hertzen.com/dist/html2canvas.js')
}

InjectHtml2canvas();


function capture(x, y, width, height) {
    // Get The canvas
    html2canvas(document.body, {
        x: x,
        y: y,
        width: width - x,
        height: height - y,
        allowTaint: true
      //Callback after image captured
    }).then(function (canvas) {
      //Create a dummy element to download the file
      const link = document.createElement("a")
      link.download = "generated_qrcode.png";
      canvas.toBlob(function (blob) {
        link.href = URL.createObjectURL(blob);
        link.click();
        link.remove();
     }) 
    });
}