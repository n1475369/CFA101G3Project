<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My WebSocket</title>
  </head>
   
  <body>
    Welcome<br/>
    <input id="text" type="text" /><button onclick="send()">Send</button> <button onclick="closeWebSocket()">Close</button>
    <div id="message">
    </div>
  </body>
   
  <script type="text/JavaScript">
      var websocket = null;
       
      //判斷當前瀏覽器是否支持WebSocket
      if('WebSocket' in window){
          websocket = new WebSocket("ws://"+ window.location.host+"/${pageContext.request.contextPath}/websocket");
      }
      else{
          alert('Not support websocket');
      }
       
      //連接發生錯誤的回調方法
      websocket.onerror = function(){
          setMessageInnerHTML("WebSocket連接發生錯誤");
      };
       
      //連接成功建立的回調方法
      websocket.onopen = function(){
          setMessageInnerHTML("WebSocket連接成功");
      };
       
      //接收到消息的回調方法
      websocket.onmessage = function(e){
          setMessageInnerHTML(e.data);
      };
       
      //連接關閉的回調方法
      websocket.onclose = function(){
          setMessageInnerHTML("WebSocket連接關閉");
      };
       
      //監聽窗口關閉事件，當窗口關閉時，主動去關閉websocket連接，防止連接還沒斷開就關閉窗口，server端會拋異常。
      window.onbeforeunload = function(){
          websocket.close();
      };
       
      //將消息顯示在網頁上
      function setMessageInnerHTML(innerHTML){
          document.getElementById('message').innerHTML += innerHTML + '<br/>';
      }
       
      //關閉連接
      function closeWebSocket(){
          websocket.close();
      }
       
      //發送消息
      function send(){
          var message = document.getElementById('text').value;
          websocket.send(message);
      }
  </script>
  
</html>