var id = new URLSearchParams(new URL(window.location.href).search).get("media");
var player = document.getElementById("player");
if (Hls.isSupported()) {
  var hls = new Hls();
  hls.attachMedia(player);
  hls.on(Hls.Events.MEDIA_ATTACHED, function () {
    hls.loadSource("/stream.m3u8");
  });
}
else if (player.canPlayType("application/vnd.apple.mpegurl")) {
  player.src = "/stream.m3u8";
}
else {
  document.getElementById("error").innerHTML = "Your browser does not support HLS.js";
}
