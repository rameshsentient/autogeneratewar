function restore(){
  $("#record, #live").removeClass("disabled");
  $("#pause").replaceWith('<a class="button one" id="pause">Pause</a>');
  $(".one").addClass("disabled");
  Fr.voice.stop();
}

function makeWaveform(){
  var analyser = Fr.voice.recorder.analyser;

  var bufferLength = analyser.frequencyBinCount;
  var dataArray = new Uint8Array(bufferLength);

 
}
$(document).ready(function(){
  $(document).on("mousedown", "#record:not(.disabled)", function(){
	  $("#record").addClass("base64");
	  Fr.voice.record($("#live").is(":checked"), function(){
      $(".recordButton").addClass("disabled");

      $("#live").addClass("disabled");
      $(".one").removeClass("disabled");

      makeWaveform();
    });
  });

  $(document).on("click", "#recordFor5:not(.disabled)", function(){
    Fr.voice.record($("#live").is(":checked"), function(){
      $(".recordButton").addClass("disabled");

      $("#live").addClass("disabled");
      $(".one").removeClass("disabled");

      makeWaveform();
    });

    Fr.voice.stopRecordingAfter(5000, function(){
      alert("Recording stopped after 5 seconds");
    });
  });

  $(document).on("click", "#pause:not(.disabled)", function(){
    if($(this).hasClass("resume")){
      Fr.voice.resume();
      $(this).replaceWith('<a class="button one" id="pause">Pause</a>');
    }else{
      Fr.voice.pause();
      $(this).replaceWith('<a class="button one resume" id="pause">Resume</a>');
    }
  });

  $(document).on("click", "#stop:not(.disabled)", function(){
    restore();
  });

  $(document).on("click", "#play:not(.disabled)", function(){
    if($(this).parent().data("type") === "mp3"){
      Fr.voice.exportMP3(function(url){
        $("#audio").attr("src", url);
        $("#audio")[0].play();
      }, "URL");
    }else{
      Fr.voice.export(function(url){
        $("#audio").attr("src", url);
        $("#audio")[0].play();
      }, "URL");
    }
    restore();
  });

  $(document).on("click", "#download:not(.disabled)", function(){
    if($(this).parent().data("type") === "mp3"){
      Fr.voice.exportMP3(function(url){
        $("<a href='" + url + "' download='MyRecording.mp3'></a>")[0].click();
      }, "URL");
    }else{
      Fr.voice.export(function(url){
        $("<a href='" + url + "' download='MyRecording.wav'></a>")[0].click();
      }, "URL");
    }
    restore();
  });

  $(document).on("mouseup", "#record:not(.disabled)", function(){
	  setLoder();
      Fr.voice.export(function(url){
          //console.log("Here is the base64 URL : " + url);
  		getText(url);

        }, "base64");
    restore();
  });

  $(document).on("click", "#save:not(.disabled)", function(){
    function upload(blob){
      var formData = new FormData();
      formData.append('file', blob);

      $.ajax({
        url: "upload.php",
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(url) {
          $("#audio").attr("src", url);
          $("#audio")[0].play();
          alert("Saved In Server. See audio element's src for URL");
        }
      });
    }
    if($(this).parent().data("type") === "mp3"){
      Fr.voice.exportMP3(upload, "blob");
    }else{
      Fr.voice.export(upload, "blob");
    }
    restore();
  });
});


function getText(base64Text) {
	
	//alert(ASR_DEMO);
	
	$.ajax({
		method: 'GET',
		timeout: 1000,
		url: "./app-config-prop.json",
		success: function(keyRes){
			//document.getElementById("disableDiv").style.display = "inline-block";
		
			var start_time = new Date().getTime();
			 $.ajax({
				headers:{'x-api-key':keyRes.API_KEY}, 
				method: 'POST',	
				url: ASR_DEMO,
				data: JSON.stringify({"audio" : base64Text}),
				timeout: 80000,
			  
				success: function(res){
					var request_time = new Date().getTime() - start_time;
					document.getElementById("callTimeasr").innerHTML="<b>Time:</b> "+request_time+" ms";
					document.getElementById("outputText").innerHTML="<p class='outputText'>"+res.text+"</p>";
					
					//document.getElementById("disableDiv").style.display = "none";
					document.getElementById("recordDiv").style.display = "inline-block";
					$("#record").removeClass("base64");
		
				},
				error:function(err){
					var request_time = new Date().getTime() - start_time;
					//alert(err);
					//console.log(err);
					document.getElementById("callTimeasr").innerHTML="<b>Time:</b> "+request_time+" ms";
					document.getElementById("outputText").innerHTML="<p class='outputText'>Error</p>";
					//document.getElementById("disableDiv").style.display = "none";
					document.getElementById("recordDiv").style.display = "inline-block";
					//document.getElementById("getTextDiv").style.display = "none";
					$("#record").removeClass("base64");
					
				}
				
			});	 
		}
	});				 
}

function clearAll() {
	
	document.getElementById("outputText").innerHTML= "";
	document.getElementById("callTimeasr").innerHTML="";
	//document.getElementById("disableDiv").style.display = "none";
	//document.getElementById("recordDiv").style.display = "none";
	//document.getElementById("getTextDiv").style.display = "inline-block";
}

function setLoder() {
	//alert(">>>> " + document.getElementById("outputText").innerHTML);
	//document.getElementById("getTextDiv").style.display = "none";
	document.getElementById("outputText").innerHTML= "<img src='resources/images/loading_spinner.gif' style='width:100px; height:100px'>";	
	
}





