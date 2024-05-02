var equalCloseEvent;
var equalSubmitEvent;
var win;
var clientViewPort;
var intervalID;
const VERIFY_URL = {
    "prod": "https://sdk-api.equal.in/business/ie/transaction/verify",
    "test": "https://sdk-api.test.equal.in/business/ie/transaction/verify"
}

const EQUAL_APP_URL = {
    "prod": "https://equal.in",
    "test": "https://test.equal.in"
}

function _listenEvents(onSDKCallBack) {
    window.addEventListener("message", (event) => {
        var equalRootView = document.getElementById('equal-modal');
        if (event.data["eventType"] != null && (event.data["eventType"] == "EQUAL_SDK_STATUS" || event.data["eventType"] == "SALES_STATUS")) {
            if(win != null)
                window.clearInterval(intervalID);
            event.data["eventType"] = "EQUAL_SDK_CALLBACK";
            if(event.data["transaction_id"] != null)
                event.data["status"] = "ON_SUBMIT";
            if (onSDKCallBack != null)
                onSDKCallBack(event.data);
            if (event.data["status"] == "ON_CLOSE") {
                if(equalCloseEvent != null)
                    equalCloseEvent(event.data);
                window.postMessage(event.data);
            } else if (event.data["status"] == "ON_SUBMIT") {
                if(equalSubmitEvent != null)
                    equalSubmitEvent(event.data);
                window.postMessage(event.data);
            }
            if (equalRootView != null) {
                document.body.removeChild(equalRootView);
                if(document.querySelector("[id='equal-viewport']") != null){
                    document.querySelector("[id='equal-viewport']").remove();
                }
//                document.getElementsByTagName("head")[0].prepend(clientViewPort);
            } else {
                if(win != null)
                    win.close();
            }
        }
    }, true);
}

const checkWindow = (onSDKCallBack)=>{
    if (win && win.closed) {
        window.clearInterval(intervalID);
        var data = {
            eventType: 'EQUAL_SDK_CALLBACK',
            status: 'ON_CLOSE',
            message: "Window closed by user",
            transaction_id: null
        };
        if (onSDKCallBack != null) {
            onSDKCallBack(data);
        } else if(equalCloseEvent != null) {
            equalCloseEvent(data);
        } else {
            window.postMessage(data);
        }
    }
};

const initForCloseEvent = (onSDKCallBack)=>{
    intervalID = window.setInterval(
        () => checkWindow(onSDKCallBack), 500);
};

const isIOSMobile = ()=>{
     if (navigator.userAgent.match(/iPhone/i)
     || navigator.userAgent.match(/iPad/i)
     || navigator.userAgent.match(/iPod/i)) {
        return true;
     } else {
        return false;
     }
};

const isMobileDevice = ()=>{
     if (navigator.userAgent.match(/Android/i)
     || navigator.userAgent.match(/webOS/i)
     || navigator.userAgent.match(/iPhone/i)
     || navigator.userAgent.match(/iPad/i)
     || navigator.userAgent.match(/iPod/i)
     || navigator.userAgent.match(/BlackBerry/i)
     || navigator.userAgent.match(/Windows Phone/i)) {
        return true;
     } else {
        return false;
     }
};

function EqualSDK(requestObj) {
    let {client_id: clientId, idempotency_id: idempotencyId, token, mobile} = requestObj;

    let equalDomain = EQUAL_APP_URL.prod;
    let verifyUrl = VERIFY_URL.prod;

    if (token && idempotencyId && clientId) {
        if (token.startsWith("test")) {
            equalDomain = EQUAL_APP_URL.test;
            verifyUrl = VERIFY_URL.test;
        }
    }

    this.onErrorMessage = (callBack, statusCode, errorMessage) => {
        if (callBack != null) {
            callBack({ 'eventType': 'EQUAL_SDK_CALLBACK', 'status': 'ERROR', 'statusCode': statusCode, 'message': errorMessage });
        }
        if (equalCloseEvent != null) {
            equalCloseEvent({ 'eventType': 'EQUAL_SDK_CALLBACK', 'status': 'ERROR', 'statusCode': statusCode, 'message': errorMessage });
        }
        window.postMessage({ 'eventType': 'EQUAL_SDK_CALLBACK', 'status': 'ERROR', 'statusCode': statusCode, 'message': errorMessage });
    }

    this.openGateway = async (onSubmitEvent, onCloseEvent) =>{
            if(isMobileDevice()){
                this.addMobileViewPort();
            }
            equalSubmitEvent = onSubmitEvent;
            equalCloseEvent = onCloseEvent;
            this.openSDKGateway(null);
    }

    this.addMobileViewPort = () =>{
        clientViewPort = document.querySelector("[name='viewport']");
        var metaTag = document.createElement("meta");
        metaTag.id = 'equal-viewport';
        metaTag.name = "viewport";
        metaTag.content =
          "width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0";
        document.getElementsByTagName("head")[0].prepend(metaTag);
//        if(clientViewPort != null){
//              document.querySelector("[name='viewport' and id!='equal-viewport']").remove();
//        }
    }


    this.openSDKGateway = async (callBack) => {
        if (clientId == null || idempotencyId == null || token == null) {
            var messageFor = (clientId == null) ? 'Clint Id' : (idempotencyId == null ? 'Idempotency Id' : (token == null ? 'Token' : ''));
            this.onErrorMessage(callBack, 'UNKNOWN', messageFor.concat(' should not be null'));
            return;
        }

        const response = await fetch(verifyUrl, {
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                'client_id': clientId,
                'token': token,
                'idempotency_id': idempotencyId
            }),
        });

        response.json().then(data => {
            if (data['status'] == 'SUCCESS') {
                var code = data['code'];
                var transactionId = data['transaction_id'];
                var iframeUrl = equalDomain + "/app/gateway?transaction_id=" + transactionId + "&code=" + code + "&source=sales&sdk_launch=true&embedded=true";
                if(mobile != null)
                   iframeUrl = iframeUrl + "&mb=" + btoa(mobile??'');
                this.equalRootView = document.createElement('div');
                this.equalRootView.id = 'equal-modal';
                this.equalRootView.setAttribute("style", "z-index:3; display:block; padding-top:100px; position:fixed; left:0; top:0; width:100%; height:100%; overflow:auto; background-color:rgb(0,0,0); background-color:rgba(0,0,0,0.4)");

                var div = document.createElement('div');
                div.id = 'loading';
                let width = '480px';
                let height = '95%';
                if(isMobileDevice()){
                    height = '99%'
                    width = '99%';
                }else{
                    width = '480px';
                    height = '96%'
                }
                if(isIOSMobile()){
                    if ('visualViewport' in window) {
                        const VIEWPORT_VS_CLIENT_HEIGHT_RATIO = 0.75;
                        window.visualViewport.addEventListener('resize', function (event) {
                            if ((event.target.height * event.target.scale) / window.screen.height < VIEWPORT_VS_CLIENT_HEIGHT_RATIO) {
                                eIframe.contentWindow.postMessage({'eventType': 'EQUAL_KEYBOARD_EVENT', 'status': 'OPEN', 'height': (window.outerHeight - window.innerHeight) + 0}, '*');
                            } else {
                                eIframe.contentWindow.postMessage({'eventType': 'EQUAL_KEYBOARD_EVENT', 'status': 'CLOSED'}, '*');
                            }
                        });
                    }
                }
                div.setAttribute("style", "position: fixed; left: 50%; top: 50%; transform: translate(-50%, -50%); height: "+height+"; width: "+width+"; background: #ffffff; overflow: hidden; border-radius: 8px; cursor: pointer; box-shadow: 0 0 8px 8px rgb(0 0 0 / 10%);");

                var eIframe = document.createElement("iframe");
                eIframe.id = "equalIframe"
                eIframe.setAttribute("src", iframeUrl);
                eIframe.setAttribute("style", "height: 100%; width: 100%;");
                eIframe.setAttribute("sandbox", "allow-same-origin allow-scripts allow-forms allow-popups");
                eIframe.setAttribute("frameBorder", "0");
                div.appendChild(eIframe);
                this.equalRootView.appendChild(div);
                document.body.appendChild(this.equalRootView);
                _listenEvents(callBack);
            } else {
                var errorMessage = data['message'] != null ? data['message'] : 'We where unable to load the gateway due to technical error. Please try again';
                var statusCode = 'UNABLE_TO_OPEN';
                this.onErrorMessage(callBack, statusCode, errorMessage);
            }
        });
        //Verify call
    }
}