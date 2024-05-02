import { environment } from "src/environments/environment";

export function openEqualGateway(equalData) {
    const onSubmitCallback = (response) => {
        //call api to fetch the data;
        // setTimeout(fetchVerifiedResult, 10000);
        const event = new CustomEvent('fetchEmployeeVerifyData', { detail: response });
        window.dispatchEvent(event);
        /*
        {
            status: 'SUCCESS | FAILURE',
            message: '<Any error message>',
            status_code: '<Status core representing specific failure OR success>'
        }
        */
    };

    // const fetchVerifiedResult = () => {
    //     var requestOptions = {
    //         method: 'GET',
    //         redirect: 'follow'
    //     };
    
    //     fetch(environment.ApplicationUrl + "EmployeeVerification/GetVerifiedResult?idempotencyId=" + equalData.idempotency_id + "&employeeSlno=" + equalData.employeeSlno, requestOptions)
    //         .then(result => {
    //             //console.log(result.body);
    //             const event = new CustomEvent('dataReceived', { detail: result });
    //             window.dispatchEvent(event);
    //         })
    //         .catch(error => {
    //             //console.log('error', error)
    //             const event = new CustomEvent('dataReceived', { detail: error });
    //             window.dispatchEvent(event);
    //         });
    // }

    const onErrorCallback = (response) => {
        // Any logic on gateway closure. 
        /*
       {
           status: 'ON_CLOSE <If User closes the SDK> | ERROR',
           message: '<Any error message>',
           status_code: 'UNABLE_TO_OPEN | UNKNOWN'
       }
       //openGateway should be retry with 'status' is ERROR and 'status_code' is UNABLE_TO_OPEN.
       */
    };

    const equalClient = new EqualSDK({
        "client_id": equalData.client_id,
        "idempotency_id": equalData.idempotency_id,
        "token": equalData.token,
        "mobile": equalData.mobile

        // "client_id": "equal.business.4d04e3f8-e227-423a-b89e-4e59bd2f0dbc#b82bde75-bd13-4332-a21c-771fdda82633",
        // "idempotency_id": "NSP7003007",
        // "token": "test.Zn42QX7nzX8eATNqa810uDiRk5Woh1_cEK1txFPK2Pk=",
        // "mobile":"9703633007"
    });

    equalClient.openGateway(onSubmitCallback, onErrorCallback);
}