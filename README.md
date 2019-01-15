# Web Security by VGS

### App address:  https://webvgs.herokuapp.com/

## Demo

First send your data to the Vault URL - https://tnt5jvcsgxf.SANDBOX.verygoodproxy.com
The key secret can contain any value. Let's suppose we use '{"secret":"blah blah"}'.

 ```
curl https://tnt5jvcsgxf.SANDBOX.verygoodproxy.com/data -H "Content-type: application/json" -d '{"secret":"blah blah"}'

 ```

 You will get a token {"secret":"tok_sandbox_ph3jAeW63gfhnMMRqaK8ZK"}. 

 Next use the same token to send a request from your server to VGS

  ```
curl https://webvgs.herokuapp.com/send -H "Content-type: application/json" -d '{"secret":"tok_sandbox_ph3jAeW63gfhnMMRqaK8ZK"}'

 ```

 It will return back the original information you saved in your secret key. This is how it works:


![demo](https://github.com/Rola1993/websec-VGS/blob/master/app/assets/images/sec.png)

