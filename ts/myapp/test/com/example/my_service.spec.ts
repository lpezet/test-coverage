import { MyService } from "@example/my_service";

describe("my_service", (): void => {

    it("doA", ():void => {
        new MyService();
        //console.log(new MyService().doA());
        console.log('Not doing it');
    })
});