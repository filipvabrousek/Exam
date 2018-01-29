
# Money converting
```js
const convy = (() => {

    const formatNumber = (num, type) => {
        let numSplit, int, dec;

        num = Math.abs(num);
        num = num.toFixed(2);
        numSplit = num.split(`.`);

        int = numSplit[0];
        if (int.length > 3) {
            int = `${int.substr(0, int.length - 3)}, ${int.substr(int.length - 3, 3)}`;
            //28280 -> 28, 280
        }

        dec = numSplit[1];
        return `${int}.${dec}`
    };



    const toCZK = (cur, val) => {

        let res = "";

        switch (cur) {
            case "USD":
                res = val * 22.332;
                res = formatNumber(res);
                console.log(res);
                break;

            case "EUR":
                res = val * 26.042;
                res = formatNumber(res)
                console.log(res);
                break;

            default:
                res = "Dont know this currency";

        }

        return res;
    };




    return {
        toCZK
    }
})();


convy.toCZK("USD", 200);


```
